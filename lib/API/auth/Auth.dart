// Misalkan Anda memiliki class Auth untuk mengelola status login

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/model/registermodel.dart';
import 'package:kangsayur/on_boarding/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/loginmodel.dart';

class Auth {
  final BuildContext context;
  static bool isLoggedIn = false;

  Auth(this.context); // Status login pengguna

  static Future<bool> register(String name ,File? image,String email, String password, BuildContext context, String latitude, String longitude) async {
    // Logika autentikasi dan pengecekan username dan password
    // const String _baseUrl = "https://kangsayur.nitipaja.online/api/";
    List<int> imageBytes = await File(image!.path).readAsBytes();
    var multipartFile = http.MultipartFile.fromBytes(
      'photo',
      imageBytes,
      filename: image.path.split('/').last,
    );
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

    var url = Uri.parse('https://kangsayur.nitipaja.online/api/auth/user/register');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';

     request.fields['name'] = name;
    request.files.add(multipartFile);
    request.fields['email'] = email;
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Bottom_Nav();
      },));

    } else {
      print('object');
      print(response.statusCode);
      print(responseBody);
    }

    // Jika login berhasil, atur isLoggedIn menjadi true
    return true;
  }
  //make login method
   static Future<bool> login(BuildContext context, TextEditingController _email, TextEditingController _password) async {
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
     if(response.statusCode == 200){
       LoginModel user = loginModelFromJson(response.body);
       isLoggedIn = true;
       SharedPreferences pref = await SharedPreferences.getInstance();
       pref.setString('token', user.accesToken);
       print("dibawah ini token");
       print(user.accesToken);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return Bottom_Nav();
       },));
     } else {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email atau password salah')));
     }

     return true;
   }
   //make logout method
    static Future<bool> logout(BuildContext context) async {
    //get api logout
      const String _baseUrl = "https://kangsayur.nitipaja.online/api/auth/logout";
      var url = Uri.parse(_baseUrl);
      // call token
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await http.get(Uri.parse(url.toString()),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove('token');
        pref.clear();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
        isLoggedIn = false;
      }
      return true;
    }
  }


