// To parse this JSON data, do
//
//     final tokoProductCategoryModel = tokoProductCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TokoProductCategoryModel tokoProductCategoryModelFromJson(String str) => TokoProductCategoryModel.fromJson(json.decode(str));

String tokoProductCategoryModelToJson(TokoProductCategoryModel data) => json.encode(data.toJson());

class TokoProductCategoryModel {
  String statusCode;
  String message;
  List<Datum> data;

  TokoProductCategoryModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TokoProductCategoryModel.fromJson(Map<String, dynamic> json) => TokoProductCategoryModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String namaProduk;
  String namaToko;
  String alamat;
  double distance;
  String variantImg;
  int hargaVariant;

  Datum({
    required this.id,
    required this.namaProduk,
    required this.namaToko,
    required this.alamat,
    required this.distance,
    required this.variantImg,
    required this.hargaVariant,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    namaProduk: json["nama_produk"],
    namaToko: json["nama_toko"],
    alamat: json["alamat"],
    distance: json["distance"]?.toDouble(),
    variantImg: json["variant_img"],
    hargaVariant: json["harga_variant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_produk": namaProduk,
    "nama_toko": namaToko,
    "alamat": alamat,
    "distance": distance,
    "variant_img": variantImg,
    "harga_variant": hargaVariant,
  };
}
