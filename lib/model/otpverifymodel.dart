// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) => OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
  int status;
  String message;
  String statusVerifikasi;

  OtpVerifyModel({
    required this.status,
    required this.message,
    required this.statusVerifikasi,
  });

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
    status: json["status"],
    message: json["message"],
    statusVerifikasi: json["status_verifikasi"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "status_verifikasi": statusVerifikasi,
  };
}
