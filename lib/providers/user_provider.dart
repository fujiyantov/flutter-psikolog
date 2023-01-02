import 'package:flutter/material.dart';
import 'package:psikolog/models/users.dart';
import 'package:psikolog/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  Users? _user;

  Users? get user => _user;

  set user(Users? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> me({String? token}) async {
    try {
      Users user = await UserService().me(token: token);
      _user = user;
      
      return true;
    } catch (e) {
      return false;
    }
  }
}
