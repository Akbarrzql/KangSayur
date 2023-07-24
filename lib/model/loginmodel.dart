// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  Data? data;
  String? accesToken;
  String? tokenType;

  LoginModel(
      {this.status, this.message, this.data, this.accesToken, this.tokenType});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accesToken = json['acces_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['acces_token'] = this.accesToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class Data {
  String? name;
  String? photo;
  String? email;
  Null? phoneNumber;
  Null? emailVerifiedAt;
  int? jenisKelamin;
  String? tanggalLahir;
  String? address;

  Data(
      {this.name,
      this.photo,
      this.email,
      this.phoneNumber,
      this.emailVerifiedAt,
      this.jenisKelamin,
      this.tanggalLahir,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['address'] = this.address;
    return data;
  }
}
