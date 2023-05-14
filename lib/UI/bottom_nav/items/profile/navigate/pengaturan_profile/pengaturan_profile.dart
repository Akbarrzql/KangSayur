import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kangsayur/common/color_value.dart';

class Pengaturan_Profile extends StatefulWidget {
  const Pengaturan_Profile({Key? key}) : super(key: key);

  @override
  State<Pengaturan_Profile> createState() => _Pengaturan_ProfileState();
}

class _Pengaturan_ProfileState extends State<Pengaturan_Profile> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Pengaturan Akun",
          style: TextStyle(color: Colors.black, fontSize: 16),
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
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/lock.svg",
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keamanan Akun",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text("Atur kata sandi dan keamanan diri",
                          style: TextStyle(
                              fontSize: 12, color: ColorValue.hinttext)),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/icon/arrow_right.svg",
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/maphouse.svg",
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Geolokasi",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text("Atur rekomendasi berdasarkan lokasi",
                          style: TextStyle(
                              fontSize: 12, color: ColorValue.hinttext)),
                    ],
                  ),
                  Spacer(),
                  FlutterSwitch(
                    value: isSwitched,
                    width: 40,
                    height: 20,
                    inactiveSwitchBorder: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    activeSwitchBorder: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    inactiveColor: Colors.white,
                    inactiveToggleBorder: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    activeToggleBorder: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    activeColor: ColorValue.primaryColor,
                    toggleSize: 12,
                    onToggle: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/sun.svg",
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text("Aktifkan Dark Mode",
                          style: TextStyle(
                              fontSize: 12, color: ColorValue.hinttext)),
                    ],
                  ),
                  Spacer(),
                  FlutterSwitch(
                    value: isSwitched,
                    width: 40,
                    height: 20,
                    inactiveSwitchBorder: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    activeSwitchBorder: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    inactiveColor: Colors.white,
                    inactiveToggleBorder: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    activeToggleBorder: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    activeColor: ColorValue.primaryColor,
                    toggleSize: 12,
                    onToggle: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/clean.svg",
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cache",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text("Bersihkan cache",
                          style: TextStyle(
                              fontSize: 12, color: ColorValue.hinttext)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/logout.svg",
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Keluar Akun",
                    style: TextStyle(fontSize: 16, color: Color(0xffFF0000)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
