// To parse this JSON data, do
//
//     final notifikasiListModel = notifikasiListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotifikasiListModel notifikasiListModelFromJson(String str) => NotifikasiListModel.fromJson(json.decode(str));

String notifikasiListModelToJson(NotifikasiListModel data) => json.encode(data.toJson());

class NotifikasiListModel {
  String status;
  String message;
  List<Datum> data;

  NotifikasiListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotifikasiListModel.fromJson(Map<String, dynamic> json) => NotifikasiListModel(
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
  int userId;
  String judul;
  String body;
  String image;
  DateTime tanggal;

  Datum({
    required this.userId,
    required this.judul,
    required this.body,
    required this.image,
    required this.tanggal,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["user_id"],
    judul: json["judul"],
    body: json["body"],
    image: json["image"],
    tanggal: DateTime.parse(json["tanggal"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "judul": judul,
    "body": body,
    "image": image,
    "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
  };
}
