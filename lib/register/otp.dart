import 'package:flutter/material.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/register/otp_form.dart';
import 'package:kangsayur/register/register_personal_information.dart';

class OTP extends StatefulWidget {
  final String email;
  final String password;

  const OTP({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 31.0, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masukkan kode OTP",
                style: TextStyle(
                    fontSize: 24,
                    color: ColorValue.secondaryColor,
                    fontWeight: FontWeight.w800),
              ),
              Expanded(
                  child: otpForm(
                email: widget.email,
                password: widget.password,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
