// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChatListModel chatListModelFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  int status;
  String message;
  List<ListElement> list;

  ChatListModel({
    required this.status,
    required this.message,
    required this.list,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
    status: json["status"],
    message: json["message"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  int tokoId;
  String namaToko;
  String imgProfile;
  int conversationId;
  LastConvo lastConvo;

  ListElement({
    required this.tokoId,
    required this.namaToko,
    required this.imgProfile,
    required this.conversationId,
    required this.lastConvo,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    tokoId: json["toko_id"],
    namaToko: json["nama_toko"],
    imgProfile: json["img_profile"],
    conversationId: json["conversation_id"],
    lastConvo: LastConvo.fromJson(json["lastConvo"]),
  );

  Map<String, dynamic> toJson() => {
    "toko_id": tokoId,
    "nama_toko": namaToko,
    "img_profile": imgProfile,
    "conversation_id": conversationId,
    "lastConvo": lastConvo.toJson(),
  };
}

class LastConvo {
  int id;
  int conversationId;
  int userId;
  String message;
  DateTime terakhirDikirim;

  LastConvo({
    required this.id,
    required this.conversationId,
    required this.userId,
    required this.message,
    required this.terakhirDikirim,
  });

  factory LastConvo.fromJson(Map<String, dynamic> json) => LastConvo(
    id: json["id"],
    conversationId: json["conversation_id"],
    userId: json["user_id"],
    message: json["message"],
    terakhirDikirim: DateTime.parse(json["terakhir_dikirim"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "conversation_id": conversationId,
    "user_id": userId,
    "message": message,
    "terakhir_dikirim": terakhirDikirim.toIso8601String(),
  };
}
