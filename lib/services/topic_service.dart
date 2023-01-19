import 'dart:convert';

import 'package:psikolog/helper.dart';
import 'package:psikolog/models/topic_summary.dart';
import 'package:psikolog/models/topics.dart';
import 'package:http/http.dart' as http;

class TopicService {
  String baseUrl = Helper.baseUrl;

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
      throw Exception('failed: fetch topic');
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
      throw Exception('failed: fetch topic');
    }
  }

  Future<List<TopicSummary>> getTopicSummary({
    String? token,
  }) async {
    var url = '$baseUrl/topic-summary';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      
      List<TopicSummary> topicSummary = [];

      for (var item in data) {
        topicSummary.add(TopicSummary.fromJson(item));
      }
      // List debug = [];
      // debug.add(topicSummary.map((e) => print(e.topic)));
      // print(debug);
      return topicSummary;
    } else {
      throw Exception('failed: fetch summary of topic');
    }
  }
}
