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
  String namaToko;
  String namaProduk;
  String variant;
  String image;
  int harga;
  double distance;

  Datum({
    required this.id,
    required this.namaToko,
    required this.namaProduk,
    required this.variant,
    required this.image,
    required this.harga,
    required this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    namaToko: json["nama_toko"],
    namaProduk: json["nama_produk"],
    variant: json["variant"],
    image: json["image"],
    harga: json["harga"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_toko": namaToko,
    "nama_produk": namaProduk,
    "variant": variant,
    "image": image,
    "harga": harga,
    "distance": distance,
  };
}
