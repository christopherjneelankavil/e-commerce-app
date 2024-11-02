import 'package:e_commerce_app/views/screens/authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../main/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  IconData suffixIcon = IconsaxPlusBold.eye_slash;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              // Wrap the form with the Form widget
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/login-app.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.width * 0.75,
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0550F1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  getTextFormField(
                    'Username',
                    IconsaxPlusBold.user,
                    false,
                    null, // No suffix icon for Username field
                    'Enter your username',
                  ),
                  const SizedBox(height: 20),
                  getTextFormField(
                    'Password',
                    IconsaxPlusBold.lock,
                    obscureText,
                    suffixIcon,
                    'Enter your password',
                  ),
                  const SizedBox(height: 15),
                  SlideAction(
                    innerColor: const Color(0xFF2163F5),
                    outerColor: const Color(0xFF0550F1),
                    sliderRotate: false,
                    sliderButtonIcon: const Icon(
                      IconsaxPlusBold.lock,
                      color: Colors.white,
                    ),
                    submittedIcon: const Icon(
                      IconsaxPlusBold.unlock,
                      color: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 500),
                    text: 'Slide to login',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmit: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                              (Route<dynamic> route) => route.settings.name == '/login',
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill the required fields'),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF0550F1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'New user? ',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFF0550F1),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignUpScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xFF0550F1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Generate text form field
  TextFormField getTextFormField(String label, IconData prefixIcon,
      bool obscure, IconData? suffix, String hint) {
    return TextFormField(
      obscureText: label == 'Password' ? obscureText : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the required field';
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color(0xFF0550F1)),
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xFF0550F1),
        ),
        suffixIcon: label == 'Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                    suffixIcon = obscureText
                        ? IconsaxPlusBold.eye_slash
                        : IconsaxPlusBold.eye;
                  });
                },
                icon: Icon(
                  suffixIcon,
                  color: const Color(0xFF0550F1),
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Color(0xFF0550F1),
          ),
        ),
      ),
    );
  }
}
