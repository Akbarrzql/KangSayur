import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/detail_chat/detail_chat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/detail_chat/detail_chat_user.dart';
import 'package:kangsayur/bloc/chatlist_bloc/chatlist_bloc.dart';
import 'package:kangsayur/model/chatlistmodel.dart';
import 'package:kangsayur/widget/list_chat.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../bloc/chatlist_bloc/chatlist_event.dart';
import '../../../../../../../../bloc/chatlist_bloc/chatlist_states.dart';
import '../../../../../../../../common/color_value.dart';
import '../../../../../../../detail/detail.dart';

class Chat_list extends StatefulWidget {
  const Chat_list({Key? key}) : super(key: key);

  @override
  State<Chat_list> createState() => _Chat_listState();
}

class _Chat_listState extends State<Chat_list> {
  ChatListBloc chatListBloc = ChatListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatListBloc.add(GetChatListList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chat",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //make search box with container and textfield inside, using outline border
              // Container(
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     border: Border.all(color: ColorValue.neutralColor),
              //   ),
              //   child: const Center(
              //     child: TextField(
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: ColorValue.neutralColor,
              //       ),
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(bottom: 10.0),
              //         hintText: "Cari Pelanggan",
              //         hintStyle: TextStyle(
              //           color: ColorValue.neutralColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400,
              //         ),
              //         border: InputBorder.none,
              //         prefixIcon: Icon(
              //           Icons.search,
              //           color: ColorValue.neutralColor,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              BlocBuilder<ChatListBloc, ChatListState>(
                bloc: chatListBloc,
                builder: (context, state) {
                  if (state is ChatListLoading) {
                    return chatListLoading();
                  } else if (state is ChatListLoaded) {
                    return chatList(state.chatList);
                  } else {
                    return chatListLoading();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chatList(ChatListModel chatListModel) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: chatListModel.list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListChat(
              imagePelanggan: chatListModel.list[index].imgProfile,
              namePelanggan: chatListModel.list[index].namaToko,
              pesanPelanggan: chatListModel.list[index].lastConvo.message,
              waktuPesan: DateFormat('kk:mm')
                  .format(chatListModel.list[index].lastConvo.terakhirDikirim)
                  .toString(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailChatPage(
                              conversationId:
                                  chatListModel.list[index].conversationId,
                              nameLawan: chatListModel.list[index].namaToko,
                              photoLawan: chatListModel.list[index].imgProfile,
                              idLawan:
                                  chatListModel.list[index].tokoId.toString(),
                          data: chatListModel.list[index],
                            )));
              },
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }

  Widget chatListLoading() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.grey[300]!,
                                  child: Text(
                                    "Nama Pelanggan",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: ColorValue.neutralColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.grey[300]!,
                                  child: Text(
                                    "pesanPelanggan",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: ColorValue.neutralColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey[300]!,
                              child: Text(
                                "23 11 2005",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: ColorValue.neutralColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 1,
                    color: ColorValue.hinttext,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }
}
