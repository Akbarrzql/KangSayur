// Misalkan Anda memiliki class Auth untuk mengelola status login

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kangsayur/API/otp/otp.dart';
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/model/emailverifymodel.dart';
import 'package:kangsayur/model/registermodel.dart';
import 'package:kangsayur/on_boarding/on_boarding_screen.dart';
import 'package:kangsayur/register/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/loginmodel.dart';

class Auth {
  final BuildContext context;
  static bool isLoggedIn = false;

  Auth(this.context); // Status login pengguna

  static Future<bool> register(
      String name,
      File? image,
      String email,
      String password,
      String address,
      String phoneNumber,
      DateTime birthDate,
      BuildContext context,
      String latitude,
      String longitude) async {
    // Logika autentikasi dan pengecekan username dan password
    // const String _baseUrl = "https://kangsayur.nitipaja.online/api/";
    List<int> imageBytes = await File(image!.path).readAsBytes();
    var multipartFile = http.MultipartFile.fromBytes(
      'photo',
      imageBytes,
      filename: image.path.split('/').last,
    );
    //birthdate format to remove 3 last character
    String birthdate = birthDate.toString().substring(0, 19);
    print(birthdate);

    // var url = Uri.parse(_baseUrl+"auth/user/register");
    // var response = await http
    //     .post(Uri.parse(url.toString()),
    //     headers: {
    //       'Accept': 'application/json',
    //     },
    //     body: {
    //       "name": "$name",
    //       "photo": "$multipartFile",
    //       "email": "$email",
    //       "password": "$password",
    //       "latitude": "$latitude",
    //       "longitude": "$longitude",
    //     });
    //
    var url =
        Uri.parse('https://kangsayur.nitipaja.online/api/auth/user/register');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';

    request.fields['name'] = name;
    request.files.add(multipartFile);
    request.fields['email'] = email;
    request.fields['address'] = address;
    request.fields['phone_number'] = phoneNumber;
    request.fields['tanggal_lahit'] = birthdate.toString();
    request.fields['password'] = password;
    request.fields['latitude'] = latitude;
    request.fields['longitude'] = longitude;

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    print(responseBody);
    if (response.statusCode == 200) {
      RegisterModel user = registerModelFromJson(responseBody);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', user.accesToken);
      isLoggedIn = true;
      print(user.accesToken);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Bottom_Nav()),
          (route) => false);
    } else {
      print('object');
      print(response.statusCode);
      print(responseBody);
    }

    // Jika login berhasil, atur isLoggedIn menjadi true
    return true;
  }

  //make login method
  static Future<bool> login(BuildContext context, TextEditingController _email,
      TextEditingController _password) async {
    final response = await http.post(
      Uri.parse('https://kangsayur.nitipaja.online/api/auth/login'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': _email.text,
        'password': _password.text,
      },
    );

    var data = response.body;
    print(data);
    print("token ${response.statusCode}");
    if (response.statusCode == 200) {
      LoginModel user = loginModelFromJson(response.body);
      isLoggedIn = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', user.accesToken.toString());
      print("dibawah ini token");
      print(user.accesToken);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Bottom_Nav()),
              (route) => false);
      return false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email atau password salah')));
      return false;
    }
  }

  //make logout method
  static Future<bool> logout(BuildContext context) async {
    //get api logout
    const String _baseUrl = "https://kangsayur.nitipaja.online/api/auth/logout";
    var url = Uri.parse(_baseUrl);
    // call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var response = await http.get(Uri.parse(url.toString()), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('token');
      pref.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
              (route) => false);
      isLoggedIn = false;
    }
    return true;
  }

  static Future<bool> emailVerify(
      String email, String password, BuildContext context) async {
    //get api logout
    const String _baseUrl =
        "https://kangsayur.nitipaja.online/api/twostep/email";
    var url = Uri.parse(_baseUrl);
    // call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var response = await http.post(Uri.parse(url.toString()), headers: {
      'Accept': 'application/json',
    }, body: {
      'email': email,
    });
    EmailVerifyModel emailVerifyModel = emailVerifyModelFromJson(response.body);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (emailVerifyModel.message ==
          "maaf, email yang anda masukan sudah terdaftar") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email sudah terdaftar')));
      } else {
        OTPfunc.otpSend(email);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTP(email: email, password: password)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi kesalah mohon coba lagi')));
    }
    return true;
  }
}
