// To parse this JSON data, do
//
//     final productSaleModel = productSaleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductSaleModel productSaleModelFromJson(String str) => ProductSaleModel.fromJson(json.decode(str));

String productSaleModelToJson(ProductSaleModel data) => json.encode(data.toJson());

class ProductSaleModel {
  String status;
  String message;
  String title;
  String start;
  String end;
  int secDiff;
  List<Datum> data;

  ProductSaleModel({
    required this.status,
    required this.message,
    required this.title,
    required this.start,
    required this.end,
    required this.secDiff,
    required this.data,
  });

  factory ProductSaleModel.fromJson(Map<String, dynamic> json) => ProductSaleModel(
    status: json["status"],
    message: json["message"],
    title: json["title"],
    start: json["start"],
    end: json["end"],
    secDiff: json["sec_diff"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "title": title,
    "start": start,
    "end": end,
    "sec_diff": secDiff,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int produkId;
  String namaProduk;
  int tokoId;
  String namaToko;
  String gambarProduk;
  int variantId;
  int hargaAwal;
  String variant;
  int hargaSale;
  int stok;
  double distance;
  double diskon;

  Datum({
    required this.produkId,
    required this.namaProduk,
    required this.tokoId,
    required this.namaToko,
    required this.gambarProduk,
    required this.variantId,
    required this.hargaAwal,
    required this.variant,
    required this.hargaSale,
    required this.stok,
    required this.distance,
    required this.diskon,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    produkId: json["produk_id"],
    namaProduk: json["nama_produk"],
    tokoId: json["toko_id"],
    namaToko: json["nama_toko"],
    gambarProduk: json["gambar_produk"],
    variantId: json["variant_id"],
    hargaAwal: json["harga_awal"],
    variant: json["variant"],
    hargaSale: json["harga_sale"],
    stok: json["stok"],
    distance: json["distance"]?.toDouble(),
    diskon: json["diskon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "produk_id": produkId,
    "nama_produk": namaProduk,
    "toko_id": tokoId,
    "nama_toko": namaToko,
    "gambar_produk": gambarProduk,
    "variant_id": variantId,
    "harga_awal": hargaAwal,
    "variant": variant,
    "harga_sale": hargaSale,
    "stok": stok,
    "distance": distance,
    "diskon": diskon,
  };
}
