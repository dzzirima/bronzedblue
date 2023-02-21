import 'dart:convert';

import 'package:bronzedblue/constants/error_handling.dart';
import 'package:bronzedblue/constants/utils.dart';
import 'package:bronzedblue/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bronzedblue/constants/global_variables.dart';

class Authservice {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String username,
    required String password,
    required String mobileNumber,
  }) async {
    try {
      User user = User(
          id: '',
          username: username,
          password: password,
          email: email,
          mobileNumber: mobileNumber,
          token: '',
          role: '');

      http.Response res = await http.post(Uri.parse('$uri/register'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              "Account created successfully",
            );
          });
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

//signIn user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/login'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      print(res.body);

      // ignore: use_build_context_synchronously
      loginhttpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              "Signin successfully",
            );
          });
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
