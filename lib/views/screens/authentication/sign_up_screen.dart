import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter/services.dart';
// import '../main/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  String email='';
  String password='';
  String username='';
  String fullname='';
  bool obscureText = true;
  IconData suffixIcon = IconsaxPlusBold.eye_slash;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

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
                      'assets/images/sign-up-app.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.width * 0.75,
                    ),
                  ),
                  SizedBox(height: height * 0.085),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sign Up',
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
                    username,
                  ),
                  const SizedBox(height: 15),
                  getTextFormField(
                    'Name',
                    IconsaxPlusBold.user,
                    false,
                    null, // No suffix icon for Username field
                    'Enter your name',
                    fullname,
                  ),
                  const SizedBox(height: 15),
                  getTextFormField(
                    'Email',
                    IconsaxPlusBold.message,
                    false,
                    null, // No suffix icon for Email field
                    'Enter your email',
                    email,
                  ),
                  const SizedBox(height: 15),
                  getTextFormField(
                    'Password',
                    IconsaxPlusBold.lock,
                    obscureText,
                    suffixIcon,
                    'Enter your password',
                    password
                  ),
                  const SizedBox(height: 15),
                  getTextFormField(
                    'Confirm Password',
                    IconsaxPlusBold.lock,
                    obscureText,
                    suffixIcon,
                    'Enter your password',
                    password,
                  ),
                  const SizedBox(height: 15),
                  SlideAction(
                    innerColor: const Color(0xFF2163F5),
                    outerColor: const Color(0xFF0550F1),
                    sliderRotate: false,
                    sliderButtonIcon: const Icon(
                      IconsaxPlusBold.arrow_right_2,
                      color: Colors.white,
                    ),
                    submittedIcon: const Icon(
                      IconsaxPlusBold.tick_circle,
                      color: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 500),
                    text: 'Slide to Sign Up',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmit: () async {
                      fullname = fullnameController.text;
                      username = usernameController.text;
                      email = emailController.text;
                      password = passwordController.text;
                      debugPrint('$fullname\n$username\n$email\n$password');
                      if (_formKey.currentState!.validate()) {
                        HapticFeedback.heavyImpact();
                        await _authController.signUpUsers(context: context, fullName: fullname, username: username, email: email, password: password);
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                        //       (Route<dynamic> route) => route.settings.name == '/login',

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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xFF0550F1),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(' Login',
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Generate text form field
  TextFormField getTextFormField(String label, IconData prefixIcon,
      bool obscure, IconData? suffix, String hint, String val) {
    return TextFormField(
      onChanged: (value) {
        val = value;
      },
      controller: label == 'Username'
          ? usernameController
          : label == 'Name'
          ? fullnameController
          : label == 'Email'
          ? emailController
          : passwordController,
      obscureText: label == 'Password' || label == 'Confirm Password'? obscureText : false,
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
        suffixIcon: label == 'Password' || label == 'Confirm Password'
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
