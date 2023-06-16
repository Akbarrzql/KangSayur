// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
  List<Datum> data;
  Rincian rincian;

  CheckoutModel({
    required this.data,
    required this.rincian,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    rincian: Rincian.fromJson(json["rincian"]),
  );

  Map<String, dynamic> toJson() => {
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
  int userId;
  int tokoId;
  int produkId;
  int variantId;
  dynamic? variantImg;
  String variant;
  int stok;
  int hargaVariant;
  String status;
  int inCart;

  GetProdukCheckout({
    required this.userId,
    required this.tokoId,
    required this.produkId,
    required this.variantId,
    required this.variantImg,
    required this.variant,
    required this.stok,
    required this.hargaVariant,
    required this.status,
    required this.inCart,
  });

  factory GetProdukCheckout.fromJson(Map<String, dynamic> json) => GetProdukCheckout(
    userId: json["user_id"],
    tokoId: json["toko_id"],
    produkId: json["produk_id"],
    variantId: json["variant_id"],
    variantImg: json["variant_img"],
    variant: json["variant"],
    stok: json["stok"],
    hargaVariant: json["harga_variant"],
    status: json["status"],
    inCart: json["inCart"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "toko_id": tokoId,
    "produk_id": produkId,
    "variant_id": variantId,
    "variant_img": variantImg,
    "variant": variant,
    "stok": stok,
    "harga_variant": hargaVariant,
    "status": status,
    "inCart": inCart,
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
