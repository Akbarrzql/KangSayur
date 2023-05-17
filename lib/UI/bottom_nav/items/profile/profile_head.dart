import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/pengaturan_profile/pengaturan_profile.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/ubah_profile/ubah_profile.dart';

class Profile_head extends StatefulWidget {
  const Profile_head({Key? key}) : super(key: key);

  @override
  State<Profile_head> createState() => _Profile_headState();
}

class _Profile_headState extends State<Profile_head> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 15,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Akbar Rizqullah",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text("081347464743",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                Text("akbarrizqullah228@gmail.com",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Ubah_profile()));
              },
              child: SvgPicture.asset("assets/icon/edit.svg"))
        ],
      ),
    );
  }
}
