// To parse this JSON data, do
//
//     final productMostPopularModel = productMostPopularModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductMostPopularModel productMostPopularModelFromJson(String str) =>
    ProductMostPopularModel.fromJson(json.decode(str));

String productMostPopularModelToJson(ProductMostPopularModel data) =>
    json.encode(data.toJson());

class ProductMostPopularModel {
  int satus;
  String message;
  List<Datum> data;

  ProductMostPopularModel({
    required this.satus,
    required this.message,
    required this.data,
  });

  factory ProductMostPopularModel.fromJson(Map<String, dynamic> json) =>
      ProductMostPopularModel(
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
  dynamic variantImg;
  double distance;
  String namaProduk;
  String namaToko;
  int hargaVariant;
  int visited;

  Datum({
    required this.id,
    required this.variantImg,
    required this.distance,
    required this.namaProduk,
    required this.namaToko,
    required this.hargaVariant,
    required this.visited,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        variantImg: json["variant_img"],
        distance: json["distance"]?.toDouble(),
        namaProduk: json["nama_produk"],
        namaToko: json["nama_toko"],
        hargaVariant: json["harga_variant"],
        visited: json["visited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variant_img": variantImg,
        "distance": distance,
        "nama_produk": namaProduk,
        "nama_toko": namaToko,
        "harga_variant": hargaVariant,
        "visited": visited,
      };
}
