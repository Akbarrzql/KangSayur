// To parse this JSON data, do
//
//     final checkoutBuyModel = checkoutBuyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckoutBuyModel checkoutBuyModelFromJson(String str) => CheckoutBuyModel.fromJson(json.decode(str));

String checkoutBuyModelToJson(CheckoutBuyModel data) => json.encode(data.toJson());

class CheckoutBuyModel {
  String statusCode;
  String messgae;
  InfoPengiriman infoPengiriman;
  Data data;
  Rincian rincian;

  CheckoutBuyModel({
    required this.statusCode,
    required this.messgae,
    required this.infoPengiriman,
    required this.data,
    required this.rincian,
  });

  factory CheckoutBuyModel.fromJson(Map<String, dynamic> json) => CheckoutBuyModel(
    statusCode: json["status_code"],
    messgae: json["messgae"],
    infoPengiriman: InfoPengiriman.fromJson(json["info_pengiriman"]),
    data: Data.fromJson(json["data"]),
    rincian: Rincian.fromJson(json["rincian"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "messgae": messgae,
    "info_pengiriman": infoPengiriman.toJson(),
    "data": data.toJson(),
    "rincian": rincian.toJson(),
  };
}

class Data {
  int tokoId;
  String imgProfile;
  String namaToko;
  String kota;
  int produkId;
  String namaProduk;
  int variantId;
  String variant;
  int hargaVariant;
  String gambarProduk;
  String jumlahBeli;

  Data({
    required this.tokoId,
    required this.imgProfile,
    required this.namaToko,
    required this.kota,
    required this.produkId,
    required this.namaProduk,
    required this.variantId,
    required this.variant,
    required this.hargaVariant,
    required this.gambarProduk,
    required this.jumlahBeli,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tokoId: json["toko_id"],
    imgProfile: json["img_profile"],
    namaToko: json["nama_toko"],
    kota: json["kota"],
    produkId: json["produk_id"],
    namaProduk: json["nama_produk"],
    variantId: json["variant_id"],
    variant: json["variant"],
    hargaVariant: json["harga_variant"],
    gambarProduk: json["gambar_produk"],
    jumlahBeli: json["jumlah_beli"],
  );

  Map<String, dynamic> toJson() => {
    "toko_id": tokoId,
    "img_profile": imgProfile,
    "nama_toko": namaToko,
    "kota": kota,
    "produk_id": produkId,
    "nama_produk": namaProduk,
    "variant_id": variantId,
    "variant": variant,
    "harga_variant": hargaVariant,
    "gambar_produk": gambarProduk,
    "jumlah_beli": jumlahBeli,
  };
}

class InfoPengiriman {
  int alamatId;
  String nama;
  int nomotTelepon;
  String alamat;

  InfoPengiriman({
    required this.alamatId,
    required this.nama,
    required this.nomotTelepon,
    required this.alamat,
  });

  factory InfoPengiriman.fromJson(Map<String, dynamic> json) => InfoPengiriman(
    alamatId: json["alamat_id"],
    nama: json["nama"],
    nomotTelepon: json["nomot_telepon"],
    alamat: json["alamat"],
  );

  Map<String, dynamic> toJson() => {
    "alamat_id": alamatId,
    "nama": nama,
    "nomot_telepon": nomotTelepon,
    "alamat": alamat,
  };
}

class Rincian {
  int subtotalProduk;
  double subtotalOngkir;
  double totalKeseluruhan;

  Rincian({
    required this.subtotalProduk,
    required this.subtotalOngkir,
    required this.totalKeseluruhan,
  });

  factory Rincian.fromJson(Map<String, dynamic> json) => Rincian(
    subtotalProduk: json["subtotalProduk"],
    subtotalOngkir: json["subtotalOngkir"]?.toDouble(),
    totalKeseluruhan: json["totalKeseluruhan"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "subtotalProduk": subtotalProduk,
    "subtotalOngkir": subtotalOngkir,
    "totalKeseluruhan": totalKeseluruhan,
  };
}
