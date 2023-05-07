import 'package:flutter/material.dart';

import '../common/color_value.dart';

class Set_Password extends StatefulWidget {
  const Set_Password({Key? key}) : super(key: key);

  @override
  State<Set_Password> createState() => _Set_PasswordState();
}

class _Set_PasswordState extends State<Set_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 31,
            ),
            Text(
              "Set Sandi",
              style: TextStyle(
                  fontSize: 24,
                  color: ColorValue.secondaryColor,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Buat sandi untuk akun anda",
              style: TextStyle(
                  fontSize: 16,
                  color: ColorValue.neutralColor,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Masukkan Password",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFB6B6B6),
                        fontWeight: FontWeight.normal),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Masukkan Password",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFB6B6B6),
                        fontWeight: FontWeight.normal),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 37),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Set_Password())),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
