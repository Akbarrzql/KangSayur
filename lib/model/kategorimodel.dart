// To parse this JSON data, do
//
//     final kategoriModel = kategoriModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KategoriModel kategoriModelFromJson(String str) => KategoriModel.fromJson(json.decode(str));

String kategoriModelToJson(KategoriModel data) => json.encode(data.toJson());

class KategoriModel {
  String statusCode;
  String message;
  List<Datum> data;

  KategoriModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
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
  String kategoriImg;
  String namaKategori;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.kategoriImg,
    required this.namaKategori,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kategoriImg: json["kategori_img"],
    namaKategori: json["nama_kategori"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kategori_img": kategoriImg,
    "nama_kategori": namaKategori,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
