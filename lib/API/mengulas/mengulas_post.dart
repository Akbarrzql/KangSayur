import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI/bottom_nav/bottom_nav.dart';

class Mengulas_post {
  late final BuildContext context;

  static Future<bool> mengulas(
      String rating,
      File? image,
      String comment,
      String productId,
      String tokoId,
      String variantId,
      String transactionCode,
      BuildContext context) async {
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

    var url = Uri.parse('https://kangsayur.nitipaja.online/api/user/ulasan');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var request = http.MultipartRequest('POST', url);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + '$token';
    request.fields['rating'] = rating;
    request.files.add(multipartFile);
    request.fields['comment'] = comment;
    request.fields['product_id'] = productId;
    request.fields['toko_id'] = tokoId;
    request.fields['variant_id'] = variantId;
    request.fields['transaction_code'] = transactionCode;


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