// To parse this JSON data, do
//
//     final tokoDetailModel = tokoDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TokoDetailModel tokoDetailModelFromJson(String str) => TokoDetailModel.fromJson(json.decode(str));

String tokoDetailModelToJson(TokoDetailModel data) => json.encode(data.toJson());

class TokoDetailModel {
  final String statusCode;
  final String message;
  final Data data;

  TokoDetailModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TokoDetailModel.fromJson(Map<String, dynamic> json) => TokoDetailModel(
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
  final int id;
  final String imgProfile;
  final dynamic imgHeader;
  final String namaToko;
  final String deskripsi;
  final int sellerId;
  final String alamat;
  final double longitude;
  final double latitude;
  final String provinsi;
  final String kota;
  final String open;
  final String close;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int phoneNumber;
  final List<Category> category;
  final List<Produk> produk;
  final int rating;
  final int tingkatKepuasan;
  final int transaksiBerhasil;
  final int diulasSebanyak;

  Data({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    required this.category,
    required this.produk,
    required this.rating,
    required this.tingkatKepuasan,
    required this.transaksiBerhasil,
    required this.diulasSebanyak,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    phoneNumber: json["phone_number"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    produk: List<Produk>.from(json["produk"].map((x) => Produk.fromJson(x))),
    rating: json["rating"],
    tingkatKepuasan: json["tingkat_kepuasan"],
    transaksiBerhasil: json["transaksi_berhasil"],
    diulasSebanyak: json["diulas_sebanyak"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "phone_number": phoneNumber,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "produk": List<dynamic>.from(produk.map((x) => x.toJson())),
    "rating": rating,
    "tingkat_kepuasan": tingkatKepuasan,
    "transaksi_berhasil": transaksiBerhasil,
    "diulas_sebanyak": diulasSebanyak,
  };
}

class Category {
  final int id;
  final String namaKategori;
  final String kategoriImg;

  Category({
    required this.id,
    required this.namaKategori,
    required this.kategoriImg,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    namaKategori: json["nama_kategori"],
    kategoriImg: json["kategori_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_kategori": namaKategori,
    "kategori_img": kategoriImg,
  };
}

class Produk {
  final int id;
  final String variantImg;
  final double distance;
  final String namaProduk;
  final String namaToko;
  final int hargaVariant;

  Produk({
    required this.id,
    required this.variantImg,
    required this.distance,
    required this.namaProduk,
    required this.namaToko,
    required this.hargaVariant,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    id: json["id"],
    variantImg: json["variant_img"],
    distance: json["distance"]?.toDouble(),
    namaProduk: json["nama_produk"],
    namaToko: json["nama_toko"],
    hargaVariant: json["harga_variant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "variant_img": variantImg,
    "distance": distance,
    "nama_produk": namaProduk,
    "nama_toko": namaToko,
    "harga_variant": hargaVariant,
  };
}
