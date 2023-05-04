import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home_head extends StatefulWidget {
  const Home_head({Key? key}) : super(key: key);

  @override
  State<Home_head> createState() => _Home_headState();
}

class _Home_headState extends State<Home_head> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //make container rounded for profile
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          child: Image.asset("assets/images/profile.png"),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Hallo ",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Text(
          "Akbar  ",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        SvgPicture.asset("assets/icon/cart.svg"),
        SizedBox(
          width: 17,
        ),
        SvgPicture.asset("assets/icon/mail.svg"),
      ],
    );
  }
}
