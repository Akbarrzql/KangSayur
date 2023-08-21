import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/chat/chat.dart';
import 'package:kangsayur/bloc/roomchat_bloc/roomchat_bloc.dart';
import 'package:kangsayur/model/chatlistmodel.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../../../../../../../bloc/roomchat_bloc/roomchat_event.dart';
import '../../../../../../../../../bloc/roomchat_bloc/roomchat_state.dart';
import '../../../../../../../../../common/color_value.dart';
import '../../../../../../../../../model/roomchatmodel.dart';

class DetailChatPage extends StatefulWidget {
  DetailChatPage({Key? key, required this.conversationId, required this.nameLawan, required this.photoLawan, required this.idLawan, required this.data}) : super(key: key);
  final int conversationId;
  final String nameLawan;
  final String photoLawan;
  final String idLawan;
  final ListElement data;

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  final TextEditingController _messageController =
      TextEditingController(); // Tambahkan controller untuk TextField
  late PusherClient pusher;
  StreamController<dynamic> dataStreamController = StreamController<dynamic>();
  ScrollController _scrollController = ScrollController();
  RoomChatBloc roomChatBloc = RoomChatBloc();

  //loading
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //bloc
    _initPusher();
    roomChatBloc.add(GetRoomChatList(widget.conversationId.toString()));
    //scroll to bottom when page start
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void>  _initPusher() async {
    try {
      pusher = PusherClient(
        'a1b4c333a2e77bd3dc40',
        PusherOptions(
          cluster: 'ap1',
          encrypted: true,
        ),
      );

      pusher.onConnectionStateChange((state) {
        print('Connection state changed: $state');
      });

      pusher.onConnectionError((error) {
        print('Error connecting to Pusher: $error');
      });

      await pusher.connect();

      // Subscribe to a channel
      Channel channel =
          pusher.subscribe('conversation.${widget.conversationId}');

      //untuk subscribe ke channel private
      // Channel channel = pusher.subscribePrivate('private-delivery');

      //unsbuscribe channel
      // pusher.unsubscribe('delivery');

      //disconnect
      // pusher.disconnect();

      // Bind to an event
      channel.bind('getMessagesList', (event) {
        Map<String, dynamic> eventData = jsonDecode(event!.data.toString());
        print('eventData: $eventData');
        RoomChatModel updatedRoomChatModel = RoomChatModel.fromJson(eventData);
        dataStreamController.add(updatedRoomChatModel);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    } catch (e) {
      print('Error initializing Pusher: $e');
    }
  }

  @override
  void dispose() {
    // pusher.disconnect();
    dataStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => roomChatBloc,
      child: BlocBuilder<RoomChatBloc, RoomChatState>(
        builder: (context, state) {
          if (state is RoomChatLoading) {
            return Scaffold(
                body: Center(
              child: Container(),
            ));
          } else if (state is RoomChatLoaded) {
            final roomChatModel = state.roomChat;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          'https://kangsayur.nitipaja.online${widget.photoLawan}'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //column
                    Text(
                      widget.nameLawan,
                      style: const TextStyle(
                        color: ColorValue.neutralColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorValue.neutralColor,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: dataStreamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final updatedRoomChatModel =
                              snapshot.data as RoomChatModel;
                          return ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: updatedRoomChatModel.messages.length,
                            itemBuilder: (context, index) {
                              final message =
                                  updatedRoomChatModel.messages[index];
                              return InkWell(
                                onLongPress: () {},
                                child: ChatBubble(
                                  imageUser:
                                      'https://kangsayur.nitipaja.online${widget.photoLawan.toString()}',
                                  imageSeller:
                                      'https://kangsayur.nitipaja.online${message.photo}',
                                  name: message.name.toString(),
                                  nameSeller: widget.data.namaToko.toString(),
                                  message: message.message,
                                  date: DateFormat('HH:mm').format(
                                      DateTime.parse(
                                          message.createdAt.toString())),
                                  role: message.role.toString(),
                                ),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: roomChatModel.messages.length,
                            itemBuilder: (context, index) {
                              final message = roomChatModel.messages[index];
                              return InkWell(
                                onLongPress: () {},
                                child: ChatBubble(
                                  imageUser:
                                      'https://kangsayur.nitipaja.online${widget.photoLawan.toString()}',
                                  imageSeller:
                                      'https://kangsayur.nitipaja.online${message.photo}',
                                  name: message.name.toString(),
                                  nameSeller: widget.data.namaToko.toString(),
                                  message: message.message,
                                  date: DateFormat('HH:mm').format(
                                      DateTime.parse(
                                          message.createdAt.toString())),
                                  role: message.role.toString(),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              // Tambahkan controller
                              decoration: InputDecoration(
                                hintText: 'Ketik pesan...',
                                hintStyle: TextStyle(
                                  color:
                                      ColorValue.neutralColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                filled: true,
                                fillColor:
                                    ColorValue.neutralColor.withOpacity(0.1),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (isLoading)
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: ColorValue.primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.send,
                                color: Colors.white.withOpacity(0.5),
                                size: 20,
                              ),
                            )
                          else
                            InkWell(
                              onTap: () async {
                                // Tambahkan kondisi jika _messageController.text tidak kosong
                                if (_messageController.text.isNotEmpty) {
                                  print('send');
                                  print (_messageController.text);
                                  setState(() {
                                    isLoading = true;
                                    // roomChatModel.messages.add(
                                    //   Message(
                                    //     message: _messageController.text,
                                    //     name: 'user',
                                    //     photo: widget.data.imgProfile,
                                    //     role: 'user',
                                    //     createdAt: DateTime.now(),
                                    //     updatedAt: DateTime.now(),
                                    //     id: roomChatModel.messages.length + 1,
                                    //     conversationId: widget.data.conversationId,
                                    //     isCurrentMessage: true,
                                    //     userId: 1,
                                    //   ),
                                    // );
                                    // dataStreamController.add(roomChatModel);
                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  });
                                  // Tambahkan method sendMessage
                                  await ChatFunc()
                                      .sendMessage(
                                          widget.conversationId.toString(),
                                      _messageController.text)
                                      .then((value) => {
                                            print(value),
                                            if (value == true) {_initPusher()}
                                          });

                                  setState(() {
                                    _messageController
                                        .clear(); // Clear text field

                                    isLoading = false;
                                  });
                                }
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: ColorValue.primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                        ],
                      )),
                ],
              ),
            );
          } else if (state is RoomChatError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String imageUser;
  final String imageSeller;
  final String name;
  final String nameSeller;
  final String message;
  final String date;
  final String role;

  const ChatBubble({
    required this.imageUser,
    required this.imageSeller,
    required this.name,
    required this.nameSeller,
    required this.message,
    required this.date,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          role == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              role == 'user' ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (role == "seller")
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(imageUser),
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: role == "user"
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      role == "user" ? name : nameSeller, // Tampilkan nama pengirim
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: role == "user"
                          ? const Color(0xFFDDEDE7)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: role == "user"
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message, // Tampilkan pesan
                          style: TextStyle(
                            color: role == "user"
                                ? ColorValue.neutralColor
                                : ColorValue.neutralColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date, // Tampilkan waktu pengiriman
                          style: TextStyle(
                            fontSize: 12,
                            color: role == "user"
                                ? ColorValue.hinttext
                                : ColorValue.hinttext,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (role == "user")
              CircleAvatar(
                // Foto profil Toko
                radius: 16,
                backgroundImage: NetworkImage(imageSeller),
              ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class ChatMessage {
  final String name;
  final String message;
  final String date;
  final String role;
  final bool isCurrentUser;

  ChatMessage({
    required this.name,
    required this.message,
    required this.date,
    required this.role,
    required this.isCurrentUser,
  });
}
