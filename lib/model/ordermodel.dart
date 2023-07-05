// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String status;
  Data data;

  OrderModel({
    required this.status,
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String snapToken;
  String clinetKey;

  Data({
    required this.snapToken,
    required this.clinetKey,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    snapToken: json["snap_token"],
    clinetKey: json["clinet_key"],
  );

  Map<String, dynamic> toJson() => {
    "snap_token": snapToken,
    "clinet_key": clinetKey,
  };
}
