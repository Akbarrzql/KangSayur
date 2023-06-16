// To parse this JSON data, do
//
//     final cartProductModel = cartProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartProductModel cartProductModelFromJson(String str) => CartProductModel.fromJson(json.decode(str));

String cartProductModelToJson(CartProductModel data) => json.encode(data.toJson());

class CartProductModel {
  int status;
  String message;
  List<Datum> data;

  CartProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
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
  String imgProfile;
  String namaToko;
  List<GetProductCart> getProductCart;

  Datum({
    required this.id,
    required this.imgProfile,
    required this.namaToko,
    required this.getProductCart,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imgProfile: json["img_profile"],
    namaToko: json["nama_toko"],
    getProductCart: List<GetProductCart>.from(json["get_product_cart"].map((x) => GetProductCart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profile": imgProfile,
    "nama_toko": namaToko,
    "get_product_cart": List<dynamic>.from(getProductCart.map((x) => x.toJson())),
  };
}

class GetProductCart {
  int produkId;
  String namaProduk;
  int userId;
  int tokoId;
  int variantId;
  String? variantImg;
  String variant;
  int stok;
  String status;
  int hargaVariant;
  int inCart;

  GetProductCart({
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

  factory GetProductCart.fromJson(Map<String, dynamic> json) => GetProductCart(
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
