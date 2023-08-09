// To parse this JSON data, do
//
//     final menungguDiulasModel = menungguDiulasModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MenungguDiulasModel menungguDiulasModelFromJson(String str) => MenungguDiulasModel.fromJson(json.decode(str));

String menungguDiulasModelToJson(MenungguDiulasModel data) => json.encode(data.toJson());

class MenungguDiulasModel {
  String status;
  String message;
  List<Datum> data;

  MenungguDiulasModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MenungguDiulasModel.fromJson(Map<String, dynamic> json) => MenungguDiulasModel(
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
  int orderId;
  int produkId;
  String namaProduk;
  int variantId;
  String gambarProduk;
  String jenisVariant;
  int tokoId;
  String namaToko;
  String gambarToko;
  String alamat;
  int transactionCode;

  Datum({
    required this.orderId,
    required this.produkId,
    required this.namaProduk,
    required this.variantId,
    required this.gambarProduk,
    required this.jenisVariant,
    required this.tokoId,
    required this.namaToko,
    required this.gambarToko,
    required this.alamat,
    required this.transactionCode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["order_id"],
    produkId: json["produk_id"],
    namaProduk: json["nama_produk"],
    variantId: json["variant_id"],
    gambarProduk: json["gambar_produk"],
    jenisVariant: json["jenis_variant"],
    tokoId: json["toko_id"],
    namaToko: json["nama_toko"],
    gambarToko: json["gambar_toko"],
    alamat: json["alamat"],
    transactionCode: json["transaction_code"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "produk_id": produkId,
    "nama_produk": namaProduk,
    "variant_id": variantId,
    "gambar_produk": gambarProduk,
    "jenis_variant": jenisVariant,
    "toko_id": tokoId,
    "nama_toko": namaToko,
    "gambar_toko": gambarToko,
    "alamat": alamat,
    "transaction_code": transactionCode,
  };
}

