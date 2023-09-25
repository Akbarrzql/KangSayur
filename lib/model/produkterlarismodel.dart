// To parse this JSON data, do
//
//     final produkTerlarisModel = produkTerlarisModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProdukTerlarisModel produkTerlarisModelFromJson(String str) => ProdukTerlarisModel.fromJson(json.decode(str));

String produkTerlarisModelToJson(ProdukTerlarisModel data) => json.encode(data.toJson());

class ProdukTerlarisModel {
  int status;
  String message;
  List<Datum> data;

  ProdukTerlarisModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProdukTerlarisModel.fromJson(Map<String, dynamic> json) => ProdukTerlarisModel(
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
  String namaProduk;
  String namaToko;
  int hargaVariant;
  int id;
  String variantImg;
  double distance;

  Datum({
    required this.namaProduk,
    required this.namaToko,
    required this.hargaVariant,
    required this.id,
    required this.variantImg,
    required this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    namaProduk: json["nama_produk"],
    namaToko: json["nama_toko"],
    hargaVariant: json["harga_variant"],
    id: json["id"],
    variantImg: json["variant_img"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "nama_produk": namaProduk,
    "nama_toko": namaToko,
    "harga_variant": hargaVariant,
    "id": id,
    "variant_img": variantImg,
    "distance": distance,
  };
}
