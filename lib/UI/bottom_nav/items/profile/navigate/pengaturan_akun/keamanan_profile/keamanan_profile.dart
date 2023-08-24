import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/API/auth/Auth.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/validator/validator.dart';
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

  bool _isLoading = false;

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
                  "Kata sandi harus mengandung huruf Sedikitnya 8 karakter",
                  style:
                      TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextFormField(
                  label: "Kata Sandi Baru",
                  controller: newPasswordController,
                  isPassword: true,
                  validator: (value) => InputValidator.passwordValidator(value),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextFormField(
                  label: "Konfirmasi Kata Sandi Baru",
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Confirm Password tidak boleh kosong";
                    } else if (value != newPasswordController.text.toString()) {
                      return "Confirm Password tidak sama";
                    }
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Masukkan kata sandi untuk akun KangSayur.",
                  style:
                      TextStyle(fontSize: 14, color: ColorValue.neutralColor),
                ),
                const Spacer(),
                if (_isLoading)
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text("Ubah Kata Sandi",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await Auth.updatePassword(
                            context, newPasswordController.text);
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Container(
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
