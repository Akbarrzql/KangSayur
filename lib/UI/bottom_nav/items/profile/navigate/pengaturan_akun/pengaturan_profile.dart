import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/pengaturan_akun/keamanan_profile/keaman_sendemail.dart';
import 'package:kangsayur/common/color_value.dart';

import '../../../../../../API/auth/Auth.dart';
import 'keamanan_profile/keamanan_profile.dart';

class Pengaturan_Profile extends StatefulWidget {
  const Pengaturan_Profile({Key? key}) : super(key: key);

  @override
  State<Pengaturan_Profile> createState() => _Pengaturan_ProfileState();
}

class _Pengaturan_ProfileState extends State<Pengaturan_Profile> {
  bool isSwitched = false;

  // circle progress
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Pengaturan Akun",
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
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const KeamananSendEmail();
                }));
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/lock.svg",
                      width: 18,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icon/arrow_right.svg",
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
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
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                  const Spacer(),
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
            const SizedBox(
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
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                  const Spacer(),
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
            const SizedBox(
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
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
            const SizedBox(
              height: 14,
            ),
            if (!_isLoading)
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await Auth.logout(context);
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icon/logout.svg",
                        width: 18,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "Keluar Akun",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffFF0000)),
                      ),
                    ],
                  ),
                ),
              ),
            if (_isLoading) _logoutLoading(),
          ],
        ),
      ),
    );
  }

  Widget _logoutLoading() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icon/logout.svg",
            width: 18,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            "Keluar Akun",
            style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
