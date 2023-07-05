import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/ordermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Cart {
  final String _url = 'https://kangsayur.nitipaja.online/api/';

  Future<bool> AddProductCart(
      String produkId, String tokoId, String variantId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print('dibawah ini token');
    print(token);
    try {
      var response = await http.get(
          Uri.parse(_url +
              'user/produk/cart/add?produkId=$produkId&tokoId=$tokoId&variantId=$variantId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> DeleteProductCart(String produkId, String variantId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response = await http.get(
          Uri.parse(_url +
              'user/produk/cart/delete?produkId=$produkId&variantId=$variantId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> ValueProductCart(String produkId, String tokoId,
      String inputValue, String variantId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response = await http.get(
          Uri.parse(_url +
              'user/produk/cart/custom?produkId=$produkId&tokoId=$tokoId&customInpt=$inputValue&variantId=$variantId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> UpdateStatusProductCart(
      String produkId, String variantId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response = await http.get(
          Uri.parse(_url +
              'user/produk/cart/updateStatus?produkId=$produkId&variantId=$variantId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<OrderModel> Order(List<Map<String, dynamic>> dataArray) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonData = jsonEncode({'checkout': dataArray});

    String? token = pref.getString('token');
    print(token);
    try {
      var response = await http.post(Uri.parse(_url + 'user/produk/cart/pesan'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonData);
      if (response.statusCode == 200) {
        print(response.body);
        OrderModel data = orderModelFromJson(response.body);
        print(data.data.snapToken);
        print("berhasil");
        return data;
      } else {
        print(response.body);
        throw response.body;
      }
      print(response.body);
      print(response.statusCode);
      // return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
