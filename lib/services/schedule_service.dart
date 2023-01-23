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
    String? noTelp,
    String? meetAt,
    String? chooseDate,
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
      'no_telp': noTelp,
      'meet_at': meetAt,
      'choose_date': chooseDate,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);
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

  Future<List<Schedules>> getPending({String? token}) async {
    var url = '$baseUrl/pending';
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
