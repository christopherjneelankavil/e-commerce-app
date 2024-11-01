//import 'package:e_commerce_app/views/mediaquery/media.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/login-app.png',
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //focusColor: Color(0xFF5DF3FA),
                  labelStyle: TextStyle(color: Color(0xFF0550F1)),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icon(
                    IconsaxPlusBold.user,
                    color: Color(0xFF0550F1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFF0550F1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
