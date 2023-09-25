import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navigate/pengaturan_akun/pengaturan_profile.dart';

class Profile_two extends StatefulWidget {
  const Profile_two({Key? key}) : super(key: key);

  @override
  State<Profile_two> createState() => _Profile_twoState();
}

class _Profile_twoState extends State<Profile_two> {
  final Uri _url = Uri.parse('https://drive.google.com/drive/folders/1v9l8qsI982D0VxUolQ4PY7gkYmIcMSOM?usp=sharing');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _launchUrl();
            },
            child: Container(
              height: 33,
              width: MediaQuery.of(context).size.width/2 - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffA0A0A0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Buka Toko",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    Text(">",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pengaturan_Profile()));
            },
            child: Container(
              height: 33,
              width: MediaQuery.of(context).size.width/2 - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffA0A0A0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pengaturan",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    Text(">",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }

  }
  }
