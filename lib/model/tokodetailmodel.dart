// To parse this JSON data, do
//
//     final tokoDetailModel = tokoDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TokoDetailModel tokoDetailModelFromJson(String str) => TokoDetailModel.fromJson(json.decode(str));

String tokoDetailModelToJson(TokoDetailModel data) => json.encode(data.toJson());

class TokoDetailModel {
  String statusCode;
  String message;
  Data data;

  TokoDetailModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TokoDetailModel.fromJson(Map<String, dynamic> json) => TokoDetailModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String imgProfile;
  dynamic imgHeader;
  String namaToko;
  String deskripsi;
  int sellerId;
  String alamat;
  double longitude;
  double latitude;
  String open;
  String close;
  DateTime createdAt;
  DateTime updatedAt;
  List<Category> category;

  Data({
    required this.id,
    required this.imgProfile,
    required this.imgHeader,
    required this.namaToko,
    required this.deskripsi,
    required this.sellerId,
    required this.alamat,
    required this.longitude,
    required this.latitude,
    required this.open,
    required this.close,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    imgProfile: json["img_profile"],
    imgHeader: json["img_header"],
    namaToko: json["nama_toko"],
    deskripsi: json["deskripsi"],
    sellerId: json["seller_id"],
    alamat: json["alamat"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    open: json["open"],
    close: json["close"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "img_header": imgHeader,
    "nama_toko": namaToko,
    "deskripsi": deskripsi,
    "seller_id": sellerId,
    "alamat": alamat,
    "longitude": longitude,
    "latitude": latitude,
    "open": open,
    "close": close,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String namaKategori;

  Category({
    required this.id,
    required this.namaKategori,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    namaKategori: json["nama_kategori"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_kategori": namaKategori,
  };
}
