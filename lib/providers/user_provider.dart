import 'package:bronzedblue/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    username: '',
    email: '',
    password: '',
    mobileNumber: '',
    token: '',
    role: '',
  );

  User get user => _user;

  //res.body is a string  from the server
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
