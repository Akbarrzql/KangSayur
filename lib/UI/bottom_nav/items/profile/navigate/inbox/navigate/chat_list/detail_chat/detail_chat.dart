import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../common/color_value.dart';

class Detail_chat extends StatefulWidget {
  const Detail_chat({Key? key}) : super(key: key);

  @override
  State<Detail_chat> createState() => _Detail_chatState();
}

class _Detail_chatState extends State<Detail_chat> {

  final TextEditingController _messageController = TextEditingController(); // Tambahkan controller untuk TextField

  final List<ChatMessage> _chatMessages = [
    ChatMessage(
      name: 'User',
      message: 'Halo, saya ingin bertanya mengenai produk yang dijual di toko ini?',
      date: '10:01',
      isCurrentUser: true,
    ),
    ChatMessage(
      name: 'Toko',
      message: 'Iya silahkan bertanya',
      date: '10:00',
      isCurrentUser: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F8FC),
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xffFFBD5B),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'NP',
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white
                  )
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //column
            Text(
              'Nama Pelanggan',
              style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600,color: ColorValue.neutralColor
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              reverse: true,
              itemCount: _chatMessages.length, // Gunakan jumlah pesan dalam _chatMessages
              itemBuilder: (context, index) {
                ChatMessage chatMessage = _chatMessages[index];
                return InkWell(
                  onLongPress: (){
                    //menampilkan show dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Hapus Pesan',
                            style: TextStyle(
                              color: ColorValue.neutralColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: Text(
                            'Apakah anda yakin ingin menghapus pesan ini?',
                            style: TextStyle(
                              color: ColorValue.neutralColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Batal',
                                style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _chatMessages.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Hapus',
                                style: TextStyle(
                                  color: ColorValue.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ChatBubble(
                    name: chatMessage.name,
                    message: chatMessage.message,
                    date: chatMessage.date,
                    isCurrentUser: chatMessage.isCurrentUser,
                  ),
                );
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
                      controller: _messageController, // Tambahkan controller
                      decoration: InputDecoration(
                        hintText: 'Ketik pesan...',
                        hintStyle: TextStyle(
                          color: ColorValue.neutralColor.withOpacity(0.5),
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
                        fillColor: ColorValue.neutralColor.withOpacity(0.1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      // Tambahkan kondisi jika _messageController.text tidak kosong
                      if (_messageController.text.isNotEmpty) {
                        setState(() {
                          _chatMessages.insert(
                            0,
                            ChatMessage(
                              name: 'Toko',
                              message: _messageController.text,
                              date: '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
                              isCurrentUser: true,
                            ),
                          );
                        });
                        _messageController.clear(); // Clear text field
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
              )
          ),
        ],
      ),
    );

  }

}

class ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final String date;
  final bool isCurrentUser;

  const ChatBubble({
    required this.name,
    required this.message,
    required this.date,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isCurrentUser)
              const CircleAvatar(
                // Foto profil toko
                backgroundImage: AssetImage('assets/images/wortel.png'),
                radius: 16,
                backgroundColor: ColorValue.tertiaryColor,
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      name, // Tampilkan nama pengirim
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCurrentUser ? ColorValue.neutralColor : ColorValue.neutralColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isCurrentUser ? const Color(0xFFDDEDE7) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message, // Tampilkan pesan
                          style: TextStyle(
                            color: isCurrentUser ? ColorValue.neutralColor : ColorValue.neutralColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date, // Tampilkan waktu pengiriman
                          style: TextStyle(
                            fontSize: 12,
                            color: isCurrentUser ? ColorValue.hinttext : ColorValue.hinttext,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isCurrentUser)
              const CircleAvatar(
                // Foto profil User
                backgroundImage: AssetImage('assets/images/profile.png'),
                radius: 16,
                backgroundColor: ColorValue.primaryColor,
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
  final bool isCurrentUser;

  ChatMessage({
    required this.name,
    required this.message,
    required this.date,
    required this.isCurrentUser,
  });
}
