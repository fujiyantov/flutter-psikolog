import 'dart:convert';

import 'package:psikolog/helper.dart';
import 'package:psikolog/models/faculties.dart';
import 'package:http/http.dart' as http;
import 'package:psikolog/models/study_programs.dart';

class MasterService {
  String baseUrl = Helper.baseUrl;

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
      List debug = [];
      debug.add(faculties.map((e) => print(e.title)));

      print(debug);
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