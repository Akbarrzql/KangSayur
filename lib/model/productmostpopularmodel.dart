// To parse this JSON data, do
//
//     final productMostPopularModel = productMostPopularModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductMostPopularModel productMostPopularModelFromJson(String str) => ProductMostPopularModel.fromJson(json.decode(str));

String productMostPopularModelToJson(ProductMostPopularModel data) => json.encode(data.toJson());

class ProductMostPopularModel {
  int satus;
  String message;
  List<Datum> data;

  ProductMostPopularModel({
    required this.satus,
    required this.message,
    required this.data,
  });

  factory ProductMostPopularModel.fromJson(Map<String, dynamic> json) => ProductMostPopularModel(
    satus: json["satus"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "satus": satus,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  dynamic imgId;
  double distance;
  String namaProduk;
  String namaToko;
  int hargaProduk;
  int visited;

  Datum({
    required this.id,
    required this.imgId,
    required this.distance,
    required this.namaProduk,
    required this.namaToko,
    required this.hargaProduk,
    required this.visited,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgId: json["img_id"],
    distance: json["distance"]?.toDouble(),
    namaProduk: json["nama_produk"],
    namaToko: json["nama_toko"],
    hargaProduk: json["harga_produk"],
    visited: json["visited"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_id": imgId,
    "distance": distance,
    "nama_produk": namaProduk,
    "nama_toko": namaToko,
    "harga_produk": hargaProduk,
    "visited": visited,
  };
}
