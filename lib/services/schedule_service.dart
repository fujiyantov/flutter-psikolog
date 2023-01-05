import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:psikolog/helper.dart';
import 'package:psikolog/models/schedules.dart';

class ScheduleService {
  String baseUrl = Helper.baseUrl;

  Future<bool> postSchedules({
    String? token,
    int? topicId,
    String? date,
    String? time,
    int? type,
  }) async {
    var url = '$baseUrl/schedules';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({
      'topic_id': topicId,
      'date': date,
      'time': time,
      'type': type,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Schedules>> getAll({String? token}) async {
    var url = '$baseUrl/histories';
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

      List<Schedules> schedules = [];

      for (var item in data) {
        schedules.add(Schedules.fromJson(item));
      }

      return schedules;
    } else {
      return [];
    } 
  }
}
