import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/widget/textfieldcustom.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Kata sandi harus mengandung huruf dan angka. Sedikitnya 6 karakter",
                  style:
                      TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextFormField(
                  label: "Kata Sandi Lama",
                  controller: oldPasswordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextFormField(
                    label: "Kata Sandi Baru",
                    controller: newPasswordController,
                    isPassword: true),
                const SizedBox(
                  height: 14,
                ),
                CustomTextFormField(
                    label: "Konfirmasi Kata Sandi Baru",
                    controller: newPasswordController,
                    isPassword: true),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Masukkan kata sandi untuk akun KangSayur.",
                  style:
                      TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff009245),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text("Ubah Kata Sandi",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
