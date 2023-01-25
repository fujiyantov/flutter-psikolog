import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:psikolog/helper.dart';
import 'package:psikolog/models/chat.dart';

class ChatService {
  String baseUrl = Helper.baseUrl;

  Future<List<Chat>> getDataChat({String? token}) async {
    var url = '$baseUrl/chat/schedule/43';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<Chat> chat = [];

      for (var item in data) {
        chat.add(Chat.fromJson(item));
      }

      return chat;
    } else {
      return [];
    } 
  }
}
