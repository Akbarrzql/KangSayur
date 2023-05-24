import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/list_chat.dart';

import '../../../../../../../../common/color_value.dart';
import '../../../../../../../detail/detail.dart';

class Chat_list extends StatefulWidget {
  const Chat_list({Key? key}) : super(key: key);

  @override
  State<Chat_list> createState() => _Chat_listState();
}

class _Chat_listState extends State<Chat_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
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
              SizedBox(
                height: 10,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorValue.neutralColor),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      hintText: "Cari Pelanggan",
                      hintStyle: TextStyle(
                        color: ColorValue.neutralColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorValue.neutralColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListChat(imagePelanggan: "assets/images/profile.png", namePelanggan: "Wabi Sabi", pesanPelanggan: "Masih ada ngga kak produk nya?", waktuPesan: "2 Maret 2023", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail()));
                      },),
                    SizedBox(height: 15,)
                  ],
                );
              },)


            ],
          ),
        ),
      ),

    );
  }
}
