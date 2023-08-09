// To parse this JSON data, do
//
//     final alamatModel = alamatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AlamatModel alamatModelFromJson(String str) => AlamatModel.fromJson(json.decode(str));

String alamatModelToJson(AlamatModel data) => json.encode(data.toJson());

class AlamatModel {
  String status;
  String message;
  List<Name> name;

  AlamatModel({
    required this.status,
    required this.message,
    required this.name,
  });

  factory AlamatModel.fromJson(Map<String, dynamic> json) => AlamatModel(
    status: json["status"],
    message: json["message"],
    name: List<Name>.from(json["name"].map((x) => Name.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "name": List<dynamic>.from(name.map((x) => x.toJson())),
  };
}

class Name {
  int id;
  int userId;
  String namaPenerima;
  int nomorHp;
  String alamatLengkap;
  double longitude;
  double latitude;
  String labelAlamat;
  String prioritasAlamat;
  String catatan;
  DateTime createdAt;
  DateTime updatedAt;

  Name({
    required this.id,
    required this.userId,
    required this.namaPenerima,
    required this.nomorHp,
    required this.alamatLengkap,
    required this.longitude,
    required this.latitude,
    required this.labelAlamat,
    required this.prioritasAlamat,
    required this.catatan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    id: json["id"],
    userId: json["user_id"],
    namaPenerima: json["nama_penerima"],
    nomorHp: json["nomor_hp"],
    alamatLengkap: json["alamat_lengkap"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    labelAlamat: json["label_alamat"],
    prioritasAlamat: json["prioritas_alamat"],
    catatan: json["catatan"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "nama_penerima": namaPenerima,
    "nomor_hp": nomorHp,
    "alamat_lengkap": alamatLengkap,
    "longitude": longitude,
    "latitude": latitude,
    "label_alamat": labelAlamat,
    "prioritas_alamat": prioritasAlamat,
    "catatan": catatan,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
