import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:psikolog/models/auth.dart';

class AuthService {
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Auth> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Auth auth = Auth.fromJson(data);
      return auth;
    } else {
      throw Exception('Login Failed');
    }
  }

  Future<Auth> register({
    String? email,
    String? password,
    String? name,
    String? noTelp,
    String? bod,
    int? facultyId,
    int? studyProgramId,
  }) async {
    var url = '$baseUrl/register';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
      'name': name,
      'no_telp': noTelp,
      'bod': bod,
      'faculty_id': facultyId,
      'study_program_id': studyProgramId,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Auth auth = Auth.fromJson(data);
      return auth;
    } else {
      throw Exception('Register Failed');
    }
  }
}
