// To parse this JSON data, do
//
//     final detailProductModel = detailProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailProductModel detailProductModelFromJson(String str) => DetailProductModel.fromJson(json.decode(str));

String detailProductModelToJson(DetailProductModel data) => json.encode(data.toJson());

class DetailProductModel {
  String statusCode;
  String message;
  Data data;

  DetailProductModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DetailProductModel.fromJson(Map<String, dynamic> json) => DetailProductModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String namaProduk;
  double rating;
  int tokoId;
  int isOnsale;
  int produkId;
  String status;
  String imgProfile;
  dynamic imgHeader;
  String namaToko;
  String deskripsi;
  dynamic sellerId;
  String alamat;
  double longitude;
  double latitude;
  String open;
  String close;
  dynamic image;
  int harga;
  List<Variant> variant;
  List<Review> review;

  Data({
    required this.id,
    required this.namaProduk,
    required this.rating,
    required this.tokoId,
    required this.isOnsale,
    required this.produkId,
    required this.status,
    required this.imgProfile,
    required this.imgHeader,
    required this.namaToko,
    required this.deskripsi,
    required this.sellerId,
    required this.alamat,
    required this.longitude,
    required this.latitude,
    required this.open,
    required this.close,
    required this.image,
    required this.harga,
    required this.variant,
    required this.review,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    namaProduk: json["nama_produk"],
    rating: json["rating"]?.toDouble(),
    tokoId: json["toko_id"],
    isOnsale: json["is_onsale"],
    produkId: json["produk_id"],
    status: json["status"],
    imgProfile: json["img_profile"],
    imgHeader: json["img_header"],
    namaToko: json["nama_toko"],
    deskripsi: json["deskripsi"],
    sellerId: json["seller_id"],
    alamat: json["alamat"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    open: json["open"],
    close: json["close"],
    image: json["image"],
    harga: json["harga"],
    variant: List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
    review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_produk": namaProduk,
    "rating": rating,
    "toko_id": tokoId,
    "is_onsale": isOnsale,
    "produk_id": produkId,
    "status": status,
    "img_profile": imgProfile,
    "img_header": imgHeader,
    "nama_toko": namaToko,
    "deskripsi": deskripsi,
    "seller_id": sellerId,
    "alamat": alamat,
    "longitude": longitude,
    "latitude": latitude,
    "open": open,
    "close": close,
    "image": image,
    "harga": harga,
    "variant": List<dynamic>.from(variant.map((x) => x.toJson())),
    "review": List<dynamic>.from(review.map((x) => x.toJson())),
  };
}

class Review {
  int rating;
  dynamic imgProduct;
  String comment;
  dynamic createdAt;
  String name;
  String? photo;
  String email;
  dynamic phoneNumber;
  dynamic emailVerifiedAt;
  int sandiId;
  int jenisKelamin;
  DateTime tanggalLahir;
  dynamic address;
  double? longitude;
  double? latitude;
  dynamic rememberToken;

  Review({
    required this.rating,
    required this.imgProduct,
    required this.comment,
    required this.createdAt,
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
    required this.rememberToken,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"],
    imgProduct: json["img_product"],
    comment: json["comment"],
    createdAt: json["created_at"],
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
    rememberToken: json["remember_token"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "img_product": imgProduct,
    "comment": comment,
    "created_at": createdAt,
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
    "remember_token": rememberToken,
  };
}

class Variant {
  int id;
  int productId;
  dynamic variantImg;
  String variant;
  String variantDesc;
  int stok;
  int hargaVariant;
  DateTime createdAt;
  DateTime updatedAt;

  Variant({
    required this.id,
    required this.productId,
    required this.variantImg,
    required this.variant,
    required this.variantDesc,
    required this.stok,
    required this.hargaVariant,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["product_id"],
    variantImg: json["variant_img"],
    variant: json["variant"],
    variantDesc: json["variant_desc"],
    stok: json["stok"],
    hargaVariant: json["harga_variant"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "variant_img": variantImg,
    "variant": variant,
    "variant_desc": variantDesc,
    "stok": stok,
    "harga_variant": hargaVariant,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
