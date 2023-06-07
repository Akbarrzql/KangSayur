// To parse this JSON data, do
//
//     final detailProductModel = detailProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailProductModel detailProductModelFromJson(String str) => DetailProductModel.fromJson(json.decode(str));

String detailProductModelToJson(DetailProductModel data) => json.encode(data.toJson());

class DetailProductModel {
  String? statusCode;
  String? message;
  Data? data;

  DetailProductModel({this.statusCode, this.message, this.data});

  DetailProductModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? imgId;
  String? namaProduk;
  int? hargaProduk;
  String? deskripsi;
  int? stokProduk;
  double? rating;
  int? tokoId;
  int? isOnsale;
  int? produkId;
  String? status;
  List<Review>? review;

  Data(
      {this.id,
        this.imgId,
        this.namaProduk,
        this.hargaProduk,
        this.deskripsi,
        this.stokProduk,
        this.rating,
        this.tokoId,
        this.isOnsale,
        this.produkId,
        this.status,
        this.review});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgId = json['img_id'];
    namaProduk = json['nama_produk'];
    hargaProduk = json['harga_produk'];
    deskripsi = json['deskripsi'];
    stokProduk = json['stok_produk'];
    rating = json['rating'];
    tokoId = json['toko_id'];
    isOnsale = json['is_onsale'];
    produkId = json['produk_id'];
    status = json['status'];
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_id'] = this.imgId;
    data['nama_produk'] = this.namaProduk;
    data['harga_produk'] = this.hargaProduk;
    data['deskripsi'] = this.deskripsi;
    data['stok_produk'] = this.stokProduk;
    data['rating'] = this.rating;
    data['toko_id'] = this.tokoId;
    data['is_onsale'] = this.isOnsale;
    data['produk_id'] = this.produkId;
    data['status'] = this.status;
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Review {
  int? rating;
  Null? imgProduct;
  String? comment;
  Null? createdAt;
  String? name;
  String? photo;
  String? email;
  Null? phoneNumber;
  Null? emailVerifiedAt;
  int? sandiId;
  int? jenisKelamin;
  String? tanggalLahir;
  Null? address;
  double? longitude;
  double? latitude;
  Null? rememberToken;

  Review(
      {this.rating,
        this.imgProduct,
        this.comment,
        this.createdAt,
        this.name,
        this.photo,
        this.email,
        this.phoneNumber,
        this.emailVerifiedAt,
        this.sandiId,
        this.jenisKelamin,
        this.tanggalLahir,
        this.address,
        this.longitude,
        this.latitude,
        this.rememberToken});

  Review.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    imgProduct = json['img_product'];
    comment = json['comment'];
    createdAt = json['created_at'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    sandiId = json['sandi_id'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['img_product'] = this.imgProduct;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['sandi_id'] = this.sandiId;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}

