// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int status;
  String message;
  Data data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String name;
  String? photo;
  String email;
  dynamic phoneNumber;
  dynamic emailVerifiedAt;
  int sandiId;
  int jenisKelamin;
  DateTime tanggalLahir;
  dynamic address;
  double longitude;
  double latitude;
  dynamic createdAt;
  dynamic updatedAt;
  List<Role> roles;

  Data({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.phoneNumber,
    required this.emailVerifiedAt,
    required this.sandiId,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    emailVerifiedAt: json["email_verified_at"],
    sandiId: json["sandi_id"],
    jenisKelamin: json["jenis_kelamin"],
    tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    address: json["address"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "email": email,
    "phone_number": phoneNumber,
    "email_verified_at": emailVerifiedAt,
    "sandi_id": sandiId,
    "jenis_kelamin": jenisKelamin,
    "tanggal_lahir": tanggalLahir.toIso8601String(),
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  int modelId;
  int roleId;
  String modelType;

  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
