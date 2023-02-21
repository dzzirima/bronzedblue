import 'dart:convert';

import 'package:bronzedblue/constants/error_handling.dart';
import 'package:bronzedblue/constants/utils.dart';
import 'package:bronzedblue/features/home/screen/home_screen.dart';
import 'package:bronzedblue/models/user_list.dart';
import 'package:bronzedblue/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bronzedblue/constants/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddUserService {
  void addUser({
    required BuildContext context,
    required String email,
    required String name,
  }) async {
    try {
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

  Future<List<UserFromApi>> getUsers({
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<UserFromApi> users = [];

    http.Response res = await http.post(Uri.parse('$uri/show-users'),
        body: jsonEncode({
          'token': token,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (res.statusCode == 200) {
      List apiUsers = jsonDecode(res.body)['data'];

      users = apiUsers.map((data) => UserFromApi.fromJson(data)).toList();
      // ignore: use_build_context_synchronously
      Provider.of<UserListProvider>(context, listen: false).setUsers(users);
      return users;
    } else {
      return [];
    }
  }
}
