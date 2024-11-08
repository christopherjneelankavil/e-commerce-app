import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200: //success
      onSuccess();
      break;
    case 400: //bad request
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500: //internal server error
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    case 201: //created
      onSuccess();
      break;
    default:
      showSnackBar(context, 'An error occurred');
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
