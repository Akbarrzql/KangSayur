// To parse this JSON data, do
//
//     final produkTerlarisModel = produkTerlarisModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProdukTerlarisModel produkTerlarisModelFromJson(String str) => ProdukTerlarisModel.fromJson(json.decode(str));

String produkTerlarisModelToJson(ProdukTerlarisModel data) => json.encode(data.toJson());

class ProdukTerlarisModel {
  int status;
  String message;
  List<Datum> data;

  ProdukTerlarisModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProdukTerlarisModel.fromJson(Map<String, dynamic> json) => ProdukTerlarisModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  int transactionCode;
  int productId;
  int variantId;
  int storeId;
  int userId;
  String notes;
  int alamatId;
  String statusDiulas;
  String status;
  dynamic deliveredBy;
  int discount;
  DateTime createdAt;
  DateTime updatedAt;
  String namaProduk;
  double rating;
  int kategoriId;
  int tokoId;
  int ulasanId;
  int isOnsale;
  String variantImg;
  String variant;
  String variantDesc;
  int stok;
  int hargaVariant;
  int produkId;
  String imgProfile;
  dynamic imgHeader;
  String namaToko;
  String deskripsi;
  int sellerId;
  String alamat;
  double longitude;
  double latitude;
  String provinsi;
  String kota;
  String open;
  String close;
  double distance;

  Datum({
    required this.id,
    required this.transactionCode,
    required this.productId,
    required this.variantId,
    required this.storeId,
    required this.userId,
    required this.notes,
    required this.alamatId,
    required this.statusDiulas,
    required this.status,
    required this.deliveredBy,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    required this.namaProduk,
    required this.rating,
    required this.kategoriId,
    required this.tokoId,
    required this.ulasanId,
    required this.isOnsale,
    required this.variantImg,
    required this.variant,
    required this.variantDesc,
    required this.stok,
    required this.hargaVariant,
    required this.produkId,
    required this.imgProfile,
    required this.imgHeader,
    required this.namaToko,
    required this.deskripsi,
    required this.sellerId,
    required this.alamat,
    required this.longitude,
    required this.latitude,
    required this.provinsi,
    required this.kota,
    required this.open,
    required this.close,
    required this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    transactionCode: json["transaction_code"],
    productId: json["product_id"],
    variantId: json["variant_id"],
    storeId: json["store_id"],
    userId: json["user_id"],
    notes: json["notes"],
    alamatId: json["alamat_id"],
    statusDiulas: json["status_diulas"],
    status: json["status"],
    deliveredBy: json["delivered_by"],
    discount: json["discount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    namaProduk: json["nama_produk"],
    rating: json["rating"]?.toDouble(),
    kategoriId: json["kategori_id"],
    tokoId: json["toko_id"],
    ulasanId: json["ulasan_id"],
    isOnsale: json["is_onsale"],
    variantImg: json["variant_img"],
    variant: json["variant"],
    variantDesc: json["variant_desc"],
    stok: json["stok"],
    hargaVariant: json["harga_variant"],
    produkId: json["produk_id"],
    imgProfile: json["img_profile"],
    imgHeader: json["img_header"],
    namaToko: json["nama_toko"],
    deskripsi: json["deskripsi"],
    sellerId: json["seller_id"],
    alamat: json["alamat"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    provinsi: json["provinsi"],
    kota: json["kota"],
    open: json["open"],
    close: json["close"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_code": transactionCode,
    "product_id": productId,
    "variant_id": variantId,
    "store_id": storeId,
    "user_id": userId,
    "notes": notes,
    "alamat_id": alamatId,
    "status_diulas": statusDiulas,
    "status": status,
    "delivered_by": deliveredBy,
    "discount": discount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "nama_produk": namaProduk,
    "rating": rating,
    "kategori_id": kategoriId,
    "toko_id": tokoId,
    "ulasan_id": ulasanId,
    "is_onsale": isOnsale,
    "variant_img": variantImg,
    "variant": variant,
    "variant_desc": variantDesc,
    "stok": stok,
    "harga_variant": hargaVariant,
    "produk_id": produkId,
    "img_profile": imgProfile,
    "img_header": imgHeader,
    "nama_toko": namaToko,
    "deskripsi": deskripsi,
    "seller_id": sellerId,
    "alamat": alamat,
    "longitude": longitude,
    "latitude": latitude,
    "provinsi": provinsi,
    "kota": kota,
    "open": open,
    "close": close,
    "distance": distance,
  };
}
