import 'package:flutter/material.dart';
import 'package:psikolog/models/auth.dart';
import 'package:psikolog/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  Auth? _auth;

  Auth? get auth => _auth;

  set auth(Auth? auth) {
    _auth = auth;
    notifyListeners();
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      Auth auth = await AuthService().login(
        email: email,
        password: password,
      );

      _auth = auth;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register({
    String? email,
    String? password,
    String? name,
    String? noTelp,
    String? bod,
    int? facultyId,
    int? studyProgramId,
    String? gender,
  }) async {
    try {
      Auth auth = await AuthService().register(
        email: email,
        password: password,
        name: name,
        noTelp: noTelp,
        bod: bod,
        facultyId: facultyId,
        studyProgramId: studyProgramId,
        gender: gender,
      );

      _auth = auth;
      return true;
    } catch (e) {
      return false;
    }
  }
}
