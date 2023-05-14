import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/pengaturan_profile/pengaturan_profile.dart';

class Profile_two extends StatefulWidget {
  const Profile_two({Key? key}) : super(key: key);

  @override
  State<Profile_two> createState() => _Profile_twoState();
}

class _Profile_twoState extends State<Profile_two> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Container(
            height: 33,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xffA0A0A0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text("Buka Toko",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                  Spacer(),
                  SvgPicture.asset("assets/icon/arrow_right.svg")
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              //make navigate to
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Pengaturan_Profile()));

              },
              child: Container(
                height: 33,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xffA0A0A0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text("Pengaturan",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      Spacer(),
                      SvgPicture.asset("assets/icon/arrow_right.svg")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )
;
  }
}
