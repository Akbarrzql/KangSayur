import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI/bottom_nav/bottom_nav.dart';

class Alamat {
  late final BuildContext context;

  static Future<bool> alamat(
      String name,
      String address,
      String phone,
      double latitude,
      double longitude,
      String label_alamat,
      BuildContext context) async {
    var url =
        Uri.parse('https://kangsayur.nitipaja.online/api/user/alamat/tambah');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + '$token';
    request.fields['name'] = name;
    request.fields['address'] = address;
    request.fields['phone_number'] = phone;
    request.fields['latitude'] = latitude.toString();
    request.fields['longitude'] = longitude.toString();
    request.fields['label_alamat'] = label_alamat;

    //print request body
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
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alamat berhasil ditambahkan')));

    } else {
      print('object');
      print(response.statusCode);
      print(responseBody);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alamat gagal ditambahkan')));

    }
    return true;
  }
  static Future<bool> EditAlamat(
      String name,
      String address,
      String phone,
      double latitude,
      double longitude,
      String label_alamat,
      int alamatId,
      String prioritas_alamat,
      BuildContext context) async {
    var url =
        Uri.parse('https://kangsayur.nitipaja.online/api/user/alamat/update');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + '$token';
    request.fields['alamat_id'] = alamatId.toString();
    request.fields['name'] = name;
    request.fields['address'] = address;
    request.fields['phone_number'] = phone;
    request.fields['longitude'] = longitude.toString();
    request.fields['latitude'] = latitude.toString();
    request.fields['label_alamat'] = label_alamat;
    request.fields['prioritas_alamat'] = prioritas_alamat;


    //print request body
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
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alamat berhasil ditambahkan')));

    } else {
      print('object');
      print(response.statusCode);
      print(responseBody);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alamat gagal ditambahkan')));

    }
    return true;
  }
}
