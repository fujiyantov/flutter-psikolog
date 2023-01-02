import 'dart:convert';

import 'package:psikolog/models/faculties.dart';
import 'package:http/http.dart' as http;
import 'package:psikolog/models/study_programs.dart';

class MasterService {
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Faculties>> getAllFaculty() async {
    var url = '$baseUrl/faculties';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<Faculties> faculties = [];

      for (var item in data) {
        faculties.add(Faculties.fromJson(item));
      }

      return faculties;
    } else {
      throw Exception('failed: fetch faculties');
    }
  }

  Future<List<StudyPrograms>> getAllStudyProgram() async {
    var url = '$baseUrl/study-programs';
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<StudyPrograms> studyProgram = [];

      for (var item in data) {
        studyProgram.add(StudyPrograms.fromJson(item));
      }

      return studyProgram;
    } else {
      throw Exception('failed: fetch study program');
    }
  }
}