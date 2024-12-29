import 'dart:convert';

import 'package:e_commerce_app/global_variables.dart';
import 'package:e_commerce_app/models/services/manage_http.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../views/screens/main/home_screen.dart';

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String fullName,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        username: username,
        email: email,
        password: password,
        state: '',
        city: '',
        locality: '',
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      );
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'User registered successfully');
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signInUsers(
      {required context, required email, required password}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      );
      
      manageHttpResponse(response: response, context: context, onSuccess: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return const HomeScreen();
        },),);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
