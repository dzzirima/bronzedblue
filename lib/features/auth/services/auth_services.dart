// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bronzedblue/constants/error_handling.dart';
import 'package:bronzedblue/constants/utils.dart';
import 'package:bronzedblue/features/home/screen/home_screen.dart';
import 'package:bronzedblue/models/user.dart';
import 'package:bronzedblue/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bronzedblue/constants/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          // ignore: duplicate_ignore
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            var myUser = jsonEncode(jsonDecode(res.body)['user']);

            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).setUser(myUser);
            await prefs.setString('token', jsonDecode(res.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );

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

  //getUser Data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        prefs.setString('token', '');

        showSnackBar(
            context, 'Your are not loged in !! , create account or login');
      }
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
