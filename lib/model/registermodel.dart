// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  int status;
  Data data;
  String accesToken;
  Sandi sandi;

  RegisterModel({
    required this.status,
    required this.data,
    required this.accesToken,
    required this.sandi,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    accesToken: json["acces_token"],
    sandi: Sandi.fromJson(json["sandi"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "acces_token": accesToken,
    "sandi": sandi.toJson(),
  };
}

class Data {
  String name;
  String email;
  int sandiId;
  int id;

  Data({
    required this.name,
    required this.email,
    required this.sandiId,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    sandiId: json["sandi_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "sandi_id": sandiId,
    "id": id,
  };
}

class Sandi {
  int id;
  String password;
  DateTime updatedAt;
  DateTime createdAt;

  Sandi({
    required this.id,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Sandi.fromJson(Map<String, dynamic> json) => Sandi(
    id: json["id"],
    password: json["password"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}
