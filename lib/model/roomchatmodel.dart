// To parse this JSON data, do
//
//     final roomChatModel = roomChatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RoomChatModel roomChatModelFromJson(String str) => RoomChatModel.fromJson(json.decode(str));

String roomChatModelToJson(RoomChatModel data) => json.encode(data.toJson());

class RoomChatModel {
  int status;
  String message;
  List<Message> messages;

  RoomChatModel({
    required this.status,
    required this.message,
    required this.messages,
  });

  factory RoomChatModel.fromJson(Map<String, dynamic> json) => RoomChatModel(
    status: json["status"],
    message: json["message"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  int id;
  int conversationId;
  int userId;
  String message;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String photo;
  String role;
  bool isCurrentMessage;

  Message({
    required this.id,
    required this.conversationId,
    required this.userId,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.photo,
    required this.role,
    required this.isCurrentMessage,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    conversationId: json["conversation_id"],
    userId: json["user_id"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    photo: json["photo"],
    role: json["role"],
    isCurrentMessage: json["isCurrentMessage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "conversation_id": conversationId,
    "user_id": userId,
    "message": message,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "photo": photo,
    "role": role,
    "isCurrentMessage": isCurrentMessage,
  };
}
