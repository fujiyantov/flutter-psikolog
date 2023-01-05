import 'dart:convert';

import 'package:psikolog/helper.dart';
import 'package:psikolog/models/users.dart';
import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = Helper.baseUrl;

  Future<Users> me({String? token}) async {
    var url = '$baseUrl/me';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Users user = Users.fromJson(data);
      return user;
    } else {
      throw Exception('failed get profile');
    }
  }
}
