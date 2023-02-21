import 'dart:core';

import 'package:bronzedblue/models/user.dart';
import 'package:bronzedblue/models/user_list.dart';
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

class UserListProvider extends ChangeNotifier {
  final List<UserFromApi> users = [];

  void setUsers(List<UserFromApi> users) {
    users = users;
    notifyListeners();
  }

  List<UserFromApi> get userList => users;
}
