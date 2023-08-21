
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/detail_chat/detail_chat_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/chatlistmodel.dart';

class ChatFunc {
  final String _url = 'https://kangsayur.nitipaja.online/api/';

  Future<bool> sendMessage(String conversationId, String message) async {
    print("conversationId : $conversationId");
    print("message : $message");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response =
      await http.post(Uri.parse(_url + 'user/chat/send'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'conversationId': conversationId,
        'message': message,
      });
      print(response.body);
      print(response.statusCode);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> startConversation(String sellerId,
  String conversationId, String nameLawan, String photoLawan, String idLawan,
  BuildContext context, ListElement data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response =
      await http.post(Uri.parse(_url + 'user/chat/start'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'interlocutor': sellerId,
      });
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            DetailChatPage(conversationId: int.parse(conversationId),
                nameLawan: nameLawan,
                photoLawan: photoLawan,
                idLawan: idLawan,
              data: data,
            ),));
        return true;
      } else {
        return false;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
