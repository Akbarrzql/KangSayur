// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) => SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) => json.encode(data.toJson());

class SearchProductModel {
  String? status;
  String? message;
  List<Data>? data;

  SearchProductModel({this.status, this.message, this.data});

  SearchProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? namaToko;
  String? namaProduk;
  String? variant;
  Null? image;
  int? harga;

  Data(
      {this.id,
        this.namaToko,
        this.namaProduk,
        this.variant,
        this.image,
        this.harga});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaToko = json['nama_toko'];
    namaProduk = json['nama_produk'];
    variant = json['variant'];
    image = json['image'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_toko'] = this.namaToko;
    data['nama_produk'] = this.namaProduk;
    data['variant'] = this.variant;
    data['image'] = this.image;
    data['harga'] = this.harga;
    return data;
  }
}

