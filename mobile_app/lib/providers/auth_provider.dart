import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:mobile_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _userModel;

  UserModel get user => _userModel;
  set user(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  Future<bool> register(
      {String? name, String? username, String? email, String? password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);

      _userModel = user;
      return true;
    } catch (e) {
      log('REGISTER : $e');
      return false;
    }
  }

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);

      _userModel = user;
      return true;
    } catch (e) {
      log('LOGIN : $e');
      return false;
    }
  }
}
