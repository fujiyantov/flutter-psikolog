import 'dart:convert';

import 'package:http/http.dart' as http;

class ScheduleService {
  String? baseUrl = 'http://127.0.0.1:8000/api';

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
    // print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
