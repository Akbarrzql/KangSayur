// To parse this JSON data, do
//
//     final startConversationModel = startConversationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StartConversationModel startConversationModelFromJson(String str) => StartConversationModel.fromJson(json.decode(str));

String startConversationModelToJson(StartConversationModel data) => json.encode(data.toJson());

class StartConversationModel {
  int status;
  int convoId;

  StartConversationModel({
    required this.status,
    required this.convoId,
  });

  factory StartConversationModel.fromJson(Map<String, dynamic> json) => StartConversationModel(
    status: json["status"],
    convoId: json["convo_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "convo_id": convoId,
  };
}
