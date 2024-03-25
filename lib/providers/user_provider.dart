import 'package:flutter/material.dart';
import 'package:login_signup/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', username: '', email: '', token: '', password: '');
  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserfromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
