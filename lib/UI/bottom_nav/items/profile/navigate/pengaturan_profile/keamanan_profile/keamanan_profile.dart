import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/common/color_value.dart';

class Keamanan_profile extends StatefulWidget {
  const Keamanan_profile({Key? key}) : super(key: key);

  @override
  State<Keamanan_profile> createState() => _Keamanan_profileState();
}

class _Keamanan_profileState extends State<Keamanan_profile> {
  //make variable text editing controller for old password, new password, and confirm password
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Keamanan Akun",
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
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Kata sandi harus mengandung huruf dan angka. Sedikitnya 6 karakter",
              style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorValue.neutralColor),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                controller: oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Kata sandi Lama",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorValue.neutralColor),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Kata sandi baru",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorValue.neutralColor),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Konfirmasi kata sandi baru",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorValue.neutralColor),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Masukkan kata sandi untuk akun KangSayur.",
              style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
            ),
            Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff009245),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text("Ubah Kata Sandi",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(height: 35,)
          ],
        ),
      ),
    );
  }
}
