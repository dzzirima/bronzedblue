import 'dart:convert';

import 'package:bronzedblue/constants/error_handling.dart';
import 'package:bronzedblue/constants/utils.dart';
import 'package:bronzedblue/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bronzedblue/constants/global_variables.dart';

class AddUserService {
  void addUser({
    required BuildContext context,
    required String email,
    required String name,
  }) async {
    try {
      print(email);
      http.Response res = await http.post(Uri.parse('$uri/add-user'),
          body: jsonEncode({
            'email': email,
            'name': name,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              "user added successfully",
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
