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
  int produkId;
  String status;
  String image;
  int harga;
  List<TokoIni> tokoIni;
  List<Variant> variant;
  List<Review> review;

  Data({
    required this.id,
    required this.namaProduk,
    required this.rating,
    required this.tokoId,
    required this.isOnsale,
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
    required this.produkId,
    required this.status,
    required this.image,
    required this.harga,
    required this.tokoIni,
    required this.variant,
    required this.review,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    namaProduk: json["nama_produk"],
    rating: json["rating"]?.toDouble() ?? 0,
    tokoId: json["toko_id"],
    isOnsale: json["is_onsale"],
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
    produkId: json["produk_id"],
    status: json["status"],
    image: json["image"],
    harga: json["harga"],
    tokoIni: List<TokoIni>.from(json["toko_ini"].map((x) => TokoIni.fromJson(x))),
    variant: List<Variant>.from(json["variant"].map((x) => Variant.fromJson(x))),
    review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_produk": namaProduk,
    "rating": rating,
    "toko_id": tokoId,
    "is_onsale": isOnsale,
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
    "produk_id": produkId,
    "status": status,
    "image": image,
    "harga": harga,
    "toko_ini": List<dynamic>.from(tokoIni.map((x) => x.toJson())),
    "variant": List<dynamic>.from(variant.map((x) => x.toJson())),
    "review": List<dynamic>.from(review.map((x) => x.toJson())),
  };
}

class Review {
  int rating;
  dynamic imgProduct;
  String comment;
  int variantId;
  int transactionCode;
  String reply;
  String direply;
  DateTime createdAt;
  String nameUser;
  String gambarUser;

  Review({
    required this.rating,
    required this.imgProduct,
    required this.comment,
    required this.variantId,
    required this.transactionCode,
    required this.reply,
    required this.direply,
    required this.createdAt,
    required this.nameUser,
    required this.gambarUser,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"],
    imgProduct: json["img_product"],
    comment: json["comment"],
    variantId: json["variant_id"],
    transactionCode: json["transaction_code"],
    reply: json["reply"],
    direply: json["direply"],
    createdAt: DateTime.parse(json["created_at"]),
    nameUser: json["name_user"],
    gambarUser: json["gambar_user"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "img_product": imgProduct,
    "comment": comment,
    "variant_id": variantId,
    "transaction_code": transactionCode,
    "reply": reply,
    "direply": direply,
    "created_at": createdAt.toIso8601String(),
    "name_user": nameUser,
    "gambar_user": gambarUser,
  };
}

class TokoIni {
  int id;
  String namaProduk;
  double rating;
  int tokoId;
  int isOnsale;
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
  int productId;
  String variantImg;
  String variant;
  String variantDesc;
  int stok;
  int hargaVariant;
  double distance;

  TokoIni({
    required this.id,
    required this.namaProduk,
    required this.rating,
    required this.tokoId,
    required this.isOnsale,
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
    required this.productId,
    required this.variantImg,
    required this.variant,
    required this.variantDesc,
    required this.stok,
    required this.hargaVariant,
    required this.distance,
  });

  factory TokoIni.fromJson(Map<String, dynamic> json) => TokoIni(
    id: json["id"],
    namaProduk: json["nama_produk"],
    rating: json["rating"]?.toDouble() ?? 0,
    tokoId: json["toko_id"],
    isOnsale: json["is_onsale"],
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
    productId: json["product_id"],
    variantImg: json["variant_img"],
    variant: json["variant"],
    variantDesc: json["variant_desc"],
    stok: json["stok"],
    hargaVariant: json["harga_variant"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_produk": namaProduk,
    "rating": rating,
    "toko_id": tokoId,
    "is_onsale": isOnsale,
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
    "product_id": productId,
    "variant_img": variantImg,
    "variant": variant,
    "variant_desc": variantDesc,
    "stok": stok,
    "harga_variant": hargaVariant,
    "distance": distance,
  };
}

class Variant {
  int id;
  int productId;
  String variantImg;
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
