import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:psikolog/helper.dart';
import 'package:psikolog/models/chat.dart';

class ChatService {
  String baseUrl = Helper.baseUrl;

  Future<List<Chat>> getDataChat({String? token, int? id}) async {
    var url = '$baseUrl/chat/schedule/$id';
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

  Future<bool> postChat({
    String? token,
    int? scheduleId,
    String? messages,
  }) async {
    var url = '$baseUrl/chat/schdules';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({
      'schedule_id': scheduleId,
      'messages': messages,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
