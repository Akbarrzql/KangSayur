// To parse this JSON data, do
//
//     final cartProductModel = cartProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartProductModel cartProductModelFromJson(String str) => CartProductModel.fromJson(json.decode(str));

String cartProductModelToJson(CartProductModel data) => json.encode(data.toJson());

class CartProductModel {
  int status;
  String message;
  List<Datum> data;

  CartProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
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
  String imgProfile;
  String namaToko;
  String alamat;
  dynamic imgId;
  String namaProduk;
  int hargaProduk;
  int varianId;
  int inCart;

  Datum({
    required this.id,
    required this.imgProfile,
    required this.namaToko,
    required this.alamat,
    required this.imgId,
    required this.namaProduk,
    required this.hargaProduk,
    required this.varianId,
    required this.inCart,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgProfile: json["img_profile"],
    namaToko: json["nama_toko"],
    alamat: json["alamat"],
    imgId: json["img_id"],
    namaProduk: json["nama_produk"],
    hargaProduk: json["harga_produk"],
    varianId: json["varian_id"],
    inCart: json["inCart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "nama_toko": namaToko,
    "alamat": alamat,
    "img_id": imgId,
    "nama_produk": namaProduk,
    "harga_produk": hargaProduk,
    "varian_id": varianId,
    "inCart": inCart,
  };
}
