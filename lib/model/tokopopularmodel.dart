// To parse this JSON data, do
//
//     final tokoPopularModel = tokoPopularModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TokoPopularModel tokoPopularModelFromJson(String str) => TokoPopularModel.fromJson(json.decode(str));

String tokoPopularModelToJson(TokoPopularModel data) => json.encode(data.toJson());

class TokoPopularModel {
  int satus;
  String message;
  String title;
  List<Datum> data;

  TokoPopularModel({
    required this.satus,
    required this.message,
    required this.title,
    required this.data,
  });

  factory TokoPopularModel.fromJson(Map<String, dynamic> json) => TokoPopularModel(
    satus: json["satus"],
    message: json["message"],
    title: json["title"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "satus": satus,
    "message": message,
    "title": title,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String imgProfile;
  double distance;
  String namaToko;
  int visited;

  Datum({
    required this.id,
    required this.imgProfile,
    required this.distance,
    required this.namaToko,
    required this.visited,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgProfile: json["img_profile"],
    distance: json["distance"]?.toDouble(),
    namaToko: json["nama_toko"],
    visited: json["visited"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "distance": distance,
    "nama_toko": namaToko,
    "visited": visited,
  };
}
