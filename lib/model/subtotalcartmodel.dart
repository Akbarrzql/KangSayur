// To parse this JSON data, do
//
//     final subTotalCartModel = subTotalCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SubTotalCartModel subTotalCartModelFromJson(String str) => SubTotalCartModel.fromJson(json.decode(str));

String subTotalCartModelToJson(SubTotalCartModel data) => json.encode(data.toJson());

class SubTotalCartModel {
  String status;
  String message;
  int? subtotal;

  SubTotalCartModel({
    required this.status,
    required this.message,
    required this.subtotal,
  });

  factory SubTotalCartModel.fromJson(Map<String, dynamic> json) => SubTotalCartModel(
    status: json["status"],
    message: json["message"],
    subtotal: json["subtotal"]?? 0,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "subtotal": subtotal,
  };
}
