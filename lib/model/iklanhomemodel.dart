// To parse this JSON data, do
//
//     final iklanHomeModel = iklanHomeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

IklanHomeModel iklanHomeModelFromJson(String str) => IklanHomeModel.fromJson(json.decode(str));

String iklanHomeModelToJson(IklanHomeModel data) => json.encode(data.toJson());

class IklanHomeModel {
  String status;
  String message;
  List<Datum> data;

  IklanHomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory IklanHomeModel.fromJson(Map<String, dynamic> json) => IklanHomeModel(
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
  String imgPamflet;
  DateTime expireThrough;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.tokoId,
    required this.imgPamflet,
    required this.expireThrough,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tokoId: json["toko_id"],
    imgPamflet: json["img_pamflet"],
    expireThrough: DateTime.parse(json["expire_through"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "toko_id": tokoId,
    "img_pamflet": imgPamflet,
    "expire_through": expireThrough.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
