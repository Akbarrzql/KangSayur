// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
  String statusCode;
  String messgae;
  InfoPengiriman infoPengiriman;
  List<Datum> data;
  Rincian rincian;

  CheckoutModel({
    required this.statusCode,
    required this.messgae,
    required this.infoPengiriman,
    required this.data,
    required this.rincian,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
    statusCode: json["status_code"],
    messgae: json["messgae"],
    infoPengiriman: InfoPengiriman.fromJson(json["info_pengiriman"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    rincian: Rincian.fromJson(json["rincian"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "messgae": messgae,
    "info_pengiriman": infoPengiriman.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "rincian": rincian.toJson(),
  };
}

class Datum {
  int id;
  String imgProfile;
  String namaToko;
  int total;
  double ongkir;
  List<GetProdukCheckout> getProdukCheckout;

  Datum({
    required this.id,
    required this.imgProfile,
    required this.namaToko,
    required this.total,
    required this.ongkir,
    required this.getProdukCheckout,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgProfile: json["img_profile"],
    namaToko: json["nama_toko"],
    total: json["total"],
    ongkir: json["ongkir"]?.toDouble(),
    getProdukCheckout: List<GetProdukCheckout>.from(json["get_produk_checkout"].map((x) => GetProdukCheckout.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "nama_toko": namaToko,
    "total": total,
    "ongkir": ongkir,
    "get_produk_checkout": List<dynamic>.from(getProdukCheckout.map((x) => x.toJson())),
  };
}

class GetProdukCheckout {
  int produkId;
  String namaProduk;
  int userId;
  int tokoId;
  int variantId;
  String variantImg;
  String variant;
  int stok;
  String status;
  int hargaVariant;
  int inCart;

  GetProdukCheckout({
    required this.produkId,
    required this.namaProduk,
    required this.userId,
    required this.tokoId,
    required this.variantId,
    required this.variantImg,
    required this.variant,
    required this.stok,
    required this.status,
    required this.hargaVariant,
    required this.inCart,
  });

  factory GetProdukCheckout.fromJson(Map<String, dynamic> json) => GetProdukCheckout(
    produkId: json["produk_id"],
    namaProduk: json["nama_produk"],
    userId: json["user_id"],
    tokoId: json["toko_id"],
    variantId: json["variant_id"],
    variantImg: json["variant_img"],
    variant: json["variant"],
    stok: json["stok"],
    status: json["status"],
    hargaVariant: json["harga_variant"],
    inCart: json["inCart"],
  );

  Map<String, dynamic> toJson() => {
    "produk_id": produkId,
    "nama_produk": namaProduk,
    "user_id": userId,
    "toko_id": tokoId,
    "variant_id": variantId,
    "variant_img": variantImg,
    "variant": variant,
    "stok": stok,
    "status": status,
    "harga_variant": hargaVariant,
    "inCart": inCart,
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
