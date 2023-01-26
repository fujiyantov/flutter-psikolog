import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psikolog/helper.dart';
import 'package:psikolog/models/auth.dart';

class AuthService {
  String baseUrl = Helper.baseUrl;

  Future<Auth> login({
    String? email,
    String? password,
    String? fcmToken,
  }) async {
    var url = '$baseUrl/login';
    
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
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
    String? gender,
    String? fcmToken,
    String? nim,
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
      'gender': gender,
      'fcm_token': fcmToken,
      'nim': nim,
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
