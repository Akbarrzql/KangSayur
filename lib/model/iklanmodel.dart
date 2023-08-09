// To parse this JSON data, do
//
//     final iklanModel = iklanModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

IklanModel iklanModelFromJson(String str) => IklanModel.fromJson(json.decode(str));

String iklanModelToJson(IklanModel data) => json.encode(data.toJson());

class IklanModel {
  String status;
  String message;
  List<Datum> data;

  IklanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory IklanModel.fromJson(Map<String, dynamic> json) => IklanModel(
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
  int tokoId;
  int kategoriId;
  String imgPamflet;
  String expireThrough;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.tokoId,
    required this.kategoriId,
    required this.imgPamflet,
    required this.expireThrough,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tokoId: json["toko_id"],
    kategoriId: json["kategori_id"],
    imgPamflet: json["img_pamflet"],
    expireThrough: json["expire_through"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "toko_id": tokoId,
    "kategori_id": kategoriId,
    "img_pamflet": imgPamflet,
    "expire_through": expireThrough,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
