// To parse this JSON data, do
//
//     final emailVerifyModel = emailVerifyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EmailVerifyModel emailVerifyModelFromJson(String str) => EmailVerifyModel.fromJson(json.decode(str));

String emailVerifyModelToJson(EmailVerifyModel data) => json.encode(data.toJson());

class EmailVerifyModel {
  int status;
  String message;

  EmailVerifyModel({
    required this.status,
    required this.message,
  });

  factory EmailVerifyModel.fromJson(Map<String, dynamic> json) => EmailVerifyModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
