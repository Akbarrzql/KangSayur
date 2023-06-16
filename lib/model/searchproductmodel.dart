// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) => SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) => json.encode(data.toJson());

class SearchProductModel {
  String status;
  String message;
  List<Datum> data;

  SearchProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String namaProduk;
  String deskripsi;
  double rating;
  int tokoId;
  int isOnsale;
  int produkId;
  String status;
  dynamic image;
  int harga;

  Datum({
    required this.id,
    required this.namaProduk,
    required this.deskripsi,
    required this.rating,
    required this.tokoId,
    required this.isOnsale,
    required this.produkId,
    required this.status,
    required this.image,
    required this.harga,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    namaProduk: json["nama_produk"],
    deskripsi: json["deskripsi"],
    rating: json["rating"]?.toDouble(),
    tokoId: json["toko_id"],
    isOnsale: json["is_onsale"],
    produkId: json["produk_id"],
    status: json["status"],
    image: json["image"],
    harga: json["harga"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_produk": namaProduk,
    "deskripsi": deskripsi,
    "rating": rating,
    "toko_id": tokoId,
    "is_onsale": isOnsale,
    "produk_id": produkId,
    "status": status,
    "image": image,
    "harga": harga,
  };
}
