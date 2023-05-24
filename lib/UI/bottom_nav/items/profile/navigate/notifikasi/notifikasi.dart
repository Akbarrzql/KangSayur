import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../common/color_value.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Notifikasi",
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
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icon/bell.svg"),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Push Notification",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
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
            )
          ],
        ),
      ),
    );
  }
}
