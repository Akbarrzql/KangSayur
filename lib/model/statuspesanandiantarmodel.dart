// To parse this JSON data, do
//
//     final statusPesananDiantarModel = statusPesananDiantarModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StatusPesananDiantarModel statusPesananDiantarModelFromJson(String str) => StatusPesananDiantarModel.fromJson(json.decode(str));

String statusPesananDiantarModelToJson(StatusPesananDiantarModel data) => json.encode(data.toJson());

class StatusPesananDiantarModel {
  String status;
  String message;
  List<Datum> data;

  StatusPesananDiantarModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StatusPesananDiantarModel.fromJson(Map<String, dynamic> json) => StatusPesananDiantarModel(
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
  String icon;
  String namaToko;
  String profilToko;
  String alamatToko;
  String tanggal;
  int kodeTransaksi;
  int tokoId;
  AlamatPengiriman alamatPengiriman;
  List<BarangPesanan> barangPesanan;
  Tagihan tagihan;
  double total;

  Datum({
    required this.icon,
    required this.namaToko,
    required this.profilToko,
    required this.alamatToko,
    required this.tanggal,
    required this.kodeTransaksi,
    required this.tokoId,
    required this.alamatPengiriman,
    required this.barangPesanan,
    required this.tagihan,
    required this.total,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    icon: json["icon"],
    namaToko: json["nama_toko"],
    profilToko: json["profil_toko"],
    alamatToko: json["alamat_toko"],
    tanggal: json["tanggal"],
    kodeTransaksi: json["kode_transaksi"],
    tokoId: json["toko_id"],
    alamatPengiriman: AlamatPengiriman.fromJson(json["alamat pengiriman"]),
    barangPesanan: List<BarangPesanan>.from(json["barang_pesanan"].map((x) => BarangPesanan.fromJson(x))),
    tagihan: Tagihan.fromJson(json["tagihan"]),
    total: json["total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "nama_toko": namaToko,
    "profil_toko": profilToko,
    "alamat_toko": alamatToko,
    "tanggal": tanggal,
    "kode_transaksi": kodeTransaksi,
    "toko_id": tokoId,
    "alamat pengiriman": alamatPengiriman.toJson(),
    "barang_pesanan": List<dynamic>.from(barangPesanan.map((x) => x.toJson())),
    "tagihan": tagihan.toJson(),
    "total": total,
  };
}

class AlamatPengiriman {
  String namaPemesan;
  dynamic nomorTelfon;
  dynamic alamat;

  AlamatPengiriman({
    required this.namaPemesan,
    required this.nomorTelfon,
    required this.alamat,
  });

  factory AlamatPengiriman.fromJson(Map<String, dynamic> json) => AlamatPengiriman(
    namaPemesan: json["nama_pemesan"],
    nomorTelfon: json["nomor_telfon"],
    alamat: json["alamat"],
  );

  Map<String, dynamic> toJson() => {
    "nama_pemesan": namaPemesan,
    "nomor_telfon": nomorTelfon,
    "alamat": alamat,
  };
}

class BarangPesanan {
  int id;
  int transactionCode;
  int productId;
  int variantId;
  int storeId;
  int userId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String variantImg;
  String variant;
  String variantDesc;
  int stok;
  int hargaVariant;
  String namaProduk;
  double rating;
  int kategoriId;
  int tokoId;
  int ulasanId;
  int isOnsale;
  int jumlahPembelian;

  BarangPesanan({
    required this.id,
    required this.transactionCode,
    required this.productId,
    required this.variantId,
    required this.storeId,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.variantImg,
    required this.variant,
    required this.variantDesc,
    required this.stok,
    required this.hargaVariant,
    required this.namaProduk,
    required this.rating,
    required this.kategoriId,
    required this.tokoId,
    required this.ulasanId,
    required this.isOnsale,
    required this.jumlahPembelian,
  });

  factory BarangPesanan.fromJson(Map<String, dynamic> json) => BarangPesanan(
    id: json["id"],
    transactionCode: json["transaction_code"],
    productId: json["product_id"],
    variantId: json["variant_id"],
    storeId: json["store_id"],
    userId: json["user_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    variantImg: json["variant_img"],
    variant: json["variant"],
    variantDesc: json["variant_desc"],
    stok: json["stok"],
    hargaVariant: json["harga_variant"],
    namaProduk: json["nama_produk"],
    rating: json["rating"]?.toDouble(),
    kategoriId: json["kategori_id"],
    tokoId: json["toko_id"],
    ulasanId: json["ulasan_id"],
    isOnsale: json["is_onsale"],
    jumlahPembelian: json["jumlah_pembelian"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_code": transactionCode,
    "product_id": productId,
    "variant_id": variantId,
    "store_id": storeId,
    "user_id": userId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "variant_img": variantImg,
    "variant": variant,
    "variant_desc": variantDesc,
    "stok": stok,
    "harga_variant": hargaVariant,
    "nama_produk": namaProduk,
    "rating": rating,
    "kategori_id": kategoriId,
    "toko_id": tokoId,
    "ulasan_id": ulasanId,
    "is_onsale": isOnsale,
    "jumlah_pembelian": jumlahPembelian,
  };
}

class Tagihan {
  int totalHarga;
  double ongkosKirim;

  Tagihan({
    required this.totalHarga,
    required this.ongkosKirim,
  });

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
    totalHarga: json["total_harga"],
    ongkosKirim: json["ongkos_kirim"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "total_harga": totalHarga,
    "ongkos_kirim": ongkosKirim,
  };
}
