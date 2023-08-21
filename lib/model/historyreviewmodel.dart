// To parse this JSON data, do
//
//     final historyReviewModel = historyReviewModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HistoryReviewModel historyReviewModelFromJson(String str) => HistoryReviewModel.fromJson(json.decode(str));

String historyReviewModelToJson(HistoryReviewModel data) => json.encode(data.toJson());

class HistoryReviewModel {
  String status;
  String message;
  List<Datum> data;

  HistoryReviewModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoryReviewModel.fromJson(Map<String, dynamic> json) => HistoryReviewModel(
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
  int produkId;
  String namaProduk;
  int variantId;
  String gambar;
  String jenisVariant;
  String namaToko;
  int rating;
  String comment;
  dynamic gambarReview;
  DateTime tanggalReview;
  String direply;
  String reply;

  Datum({
    required this.produkId,
    required this.namaProduk,
    required this.variantId,
    required this.gambar,
    required this.jenisVariant,
    required this.namaToko,
    required this.rating,
    required this.comment,
    required this.gambarReview,
    required this.tanggalReview,
    required this.direply,
    required this.reply,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    produkId: json["produk_id"],
    namaProduk: json["nama_produk"],
    variantId: json["variant_id"],
    gambar: json["gambar"],
    jenisVariant: json["jenis_variant"],
    namaToko: json["nama_toko"],
    rating: json["rating"],
    comment: json["comment"],
    gambarReview: json["gambar_review"],
    tanggalReview: DateTime.parse(json["tanggal_review"]),
    direply: json["direply"],
    reply: json["reply"],
  );

  Map<String, dynamic> toJson() => {
    "produk_id": produkId,
    "nama_produk": namaProduk,
    "variant_id": variantId,
    "gambar": gambar,
    "jenis_variant": jenisVariant,
    "nama_toko": namaToko,
    "rating": rating,
    "comment": comment,
    "gambar_review": gambarReview,
    "tanggal_review": tanggalReview.toIso8601String(),
    "direply": direply,
    "reply": reply,
  };
}
