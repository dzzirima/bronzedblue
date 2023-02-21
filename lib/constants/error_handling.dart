import 'dart:convert';

import 'package:bronzedblue/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (jsonDecode(response.body)['success']) {
    case true:
      onSuccess();
      break;
    default:
      showSnackBar(context, response.body);
  }
}

void loginhttpErrorHandle(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (jsonDecode(response.body)['status']) {
    case true:
      onSuccess();
      break;
    default:
      showSnackBar(context, response.body);
  }
}
