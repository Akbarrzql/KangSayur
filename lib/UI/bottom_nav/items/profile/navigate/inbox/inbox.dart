import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/chat_list.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/riwayat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/ulasan_anda.dart';
import 'package:kangsayur/UI/detail/ulasan/ulasan.dart';

import '../../../../../../common/color_value.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Inbox",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _inbox_list(icon: "assets/icon/reverse_chat.svg", title: "Chat", subtitle: "Percakapan pribadi anda ke seller", context: context, onTap: Chat_list()),
                _inbox_list(icon: "assets/icon/star_outlined.svg", title: "Ulasan", subtitle: "Berikan penilaian dan ulasan", context: context, onTap: Ulasan_anda()),
              ],
            ),
            SizedBox(height: 20,),
            _inbox_list(icon: "assets/icon/help_center.svg", title: "Pusat Bantuan", subtitle: "Status bantuan dari KangSayur", context: context, onTap: Inbox()),
          ],
        ),
      ),
    );
  }
}

Widget _inbox_list({
  required String icon,
  required String title,
  required String subtitle,
  required BuildContext context,
  required Widget onTap,
}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return onTap;
      },));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 130,
      width: MediaQuery.of(context).size.width / 2  - 10 - 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, width: 32, height: 32),
          SizedBox(
            height: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorValue.hinttext),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
