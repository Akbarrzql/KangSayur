import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI/bottom_nav/bottom_nav.dart';

class Edit_Profile {
  late final BuildContext context;

  static Future<bool> edit(
      String name,
      File? image,
      String email,
      String phone_number,
      String address,
      String tanggal_lahir,
      String latitude,
      String longitude,
      BuildContext context) async {
    http.MultipartFile? multipartFile = null; // Pindahkan deklarasi di sini
    bool isImaged = false;
    if (image != null) {
      isImaged = true;

      List<int> imageBytes = await File(image!.path).readAsBytes();
      multipartFile = http.MultipartFile.fromBytes(
        'photo',
        imageBytes,
        filename: image.path.split('/').last,
      );
    }
    var url =
        Uri.parse('https://kangsayur.nitipaja.online/api/user/update-profile');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + '$token';
    request.fields['name'] = name;
    if (isImaged == true && image != null) {
      request.files.add(multipartFile!);
    }
    request.fields['email'] = email;
    request.fields['phone_number'] = phone_number;
    request.fields['address'] = address;
    request.fields['tanggal_lahir'] = tanggal_lahir;
    request.fields['address'] = address;
    request.fields['latitude'] = latitude;
    request.fields['longitude'] = longitude;

    //print request body
    print (isImaged);
    print(request.fields);

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    print(responseBody);
    if (response.statusCode == 200) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Bottom_Nav();
        },
      ));
    } else {
      print('object');
      print(response.statusCode);
      print(responseBody);
    }
    return true;
  }
}
