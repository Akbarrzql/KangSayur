// To parse this JSON data, do
//
//     final nearestTokoModel = nearestTokoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NearestTokoModel nearestTokoModelFromJson(String str) => NearestTokoModel.fromJson(json.decode(str));

String nearestTokoModelToJson(NearestTokoModel data) => json.encode(data.toJson());

class NearestTokoModel {
  String statusCode;
  String message;
  List<Datum> data;

  NearestTokoModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NearestTokoModel.fromJson(Map<String, dynamic> json) => NearestTokoModel(
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
  String imgProfile;
  String namaToko;
  String alamat;
  double longitude;
  double latitude;
  double distance;

  Datum({
    required this.id,
    required this.imgProfile,
    required this.namaToko,
    required this.alamat,
    required this.longitude,
    required this.latitude,
    required this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgProfile: json["img_profile"],
    namaToko: json["nama_toko"],
    alamat: json["alamat"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "nama_toko": namaToko,
    "alamat": alamat,
    "longitude": longitude,
    "latitude": latitude,
    "distance": distance,
  };
}
