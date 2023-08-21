import 'package:flutter/material.dart';

// Misalkan Anda memiliki class Auth untuk mengelola status login

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/model/otpverifymodel.dart';
import 'package:kangsayur/model/registermodel.dart';
import 'package:kangsayur/on_boarding/on_boarding_screen.dart';
import 'package:kangsayur/register/register_personal_information.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/loginmodel.dart';

class OTPfunc {
  //context
  final BuildContext context;

  OTPfunc(this.context);

  //make logout method
  static Future<bool> otpSend(String email) async {
    //get api logout
    const String _baseUrl =
        "https://kangsayur.nitipaja.online/api/otp/generate";
    var url = Uri.parse(_baseUrl);
    // call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var response = await http.post(Uri.parse(url.toString()), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "email": "$email",
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {}
    return true;
  }

  static Future<bool> otpVerify(
      String email, String otp, String password, BuildContext context) async {
    //get api logout
    const String _baseUrl =
        "https://kangsayur.nitipaja.online/api/otp/verify";
    var url = Uri.parse(_baseUrl);
    // call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(url.toString()), headers: {
      'Accept': 'application/json',
    }, body: {
      "email": "$email",
      "otp": "$otp",
    });
    print(response.body);
    print(response.statusCode);
    OtpVerifyModel otpmodel = otpVerifyModelFromJson(response.body);
    if (response.statusCode == 200) {
      if (otpmodel.status == 200)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Register_Personal_Information(
                email: email, password: password);
          },
        ),
      );
      if (otpmodel.status == 401) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Kode OTP salah')));
      }
      if (otpmodel.status == 419) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kode OTP telah kadaluarsa')));
      }
    }

    else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi kesalahan')));
    }
    return true;
  }
}
