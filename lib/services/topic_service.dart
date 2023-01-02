import 'dart:convert';

import 'package:psikolog/models/topics.dart';
import 'package:http/http.dart' as http;

class TopicService {
  String? baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Topics>> getAll() async {
    var url = '$baseUrl/topics';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<Topics> topics = [];

      for (var item in data) {
        topics.add(Topics.fromJson(item));
      }

      return topics;
    } else {
      throw Exception('failed: fetch news');
    }
  }

  Future<Topics> getDetail({
    // String? token,
    int? id,
  }) async {
    var url = '$baseUrl/topics/$id';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      Topics topics = Topics.fromJson(data);

      return topics;
    } else {
      throw Exception('failed: fetch news');
    }
  }
}
