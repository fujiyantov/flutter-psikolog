import 'dart:convert';

import 'package:psikolog/helper.dart';
import 'package:psikolog/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  String baseUrl = Helper.baseUrl;

  Future<List<News>> getAll({String? token}) async {
    var url = '$baseUrl/news';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<News> news = [];

      for (var item in data) {
        news.add(News.fromJson(item));
      }

      return news;
    } else {
      throw Exception('failed: fetch news');
    }
  }

  Future<News> getDetail({
    String? token,
    int? id,
  }) async {
    var url = '$baseUrl/news/$id';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
      News news = News.fromJson(data);

      return news;
    } else {
      throw Exception('failed: fetch news');
    }
  }
}
