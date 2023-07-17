import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'create_account_page.dart';
import 'home_page.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "exam@modul6.com";
  String password = "Modul6exam";

  String? validateEmail(String? value) {
    if (value != null &&
        !RegExp(r"^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
            .hasMatch(value)) {
      return "Invalid email address!";
    }
    if (value != null && !value.contains(email)) {
      return "Email invalid";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return "Password is too short, it must be at least 8 characters";
    }

    if (value != null && !value.contains(password)) {
      return "Password invalid";
    }
    if (value != null && value.contains(" ")) {
      return "Password shouldn't have space";
    }

    if (value != null && !RegExp(r"\d").hasMatch(value)) {
      return "Password must have at least one number";
    }

    if (value != null && !RegExp(r"[a-z]").hasMatch(value)) {
      return "Password must have at least one letter";
    }

    if (value != null && !RegExp(r"[A-Z]").hasMatch(value)) {
      return "Password must have at least one Capital letter";
    }

    return null;
  }

  void openCreateAccountPage() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CreateAccountPage(),
    ),
  );

  void openHomePage() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: double.infinity,
              image: AssetImage(
                "assets/images/undraw_city_life_gnpr 1.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CustomText(
                pageNameLight: "Let's ",
                pageNameBold: "Sign In",
                comment: "quis nostrud exercitation ullamco laboris nisi ut",
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child:  CustomTextField(
                hintText: "Email",
                imagePath: "assets/images/email.png",
                validator: validateEmail,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomTextField(
                hintText: "Password",
                imagePath: "assets/images/lock.png",
                isObscure: true,
                inputAction: TextInputAction.done,
                validator: validatePassword,
                prefixText: "Forgot password?",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: CustomButton(
                  onTap: openHomePage,
                  text: "Login",
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2,
                  width: 150,
                  child: ColoredBox(
                    color: Color(0xFFECEDF3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Color(0xFFA1A5C1),
                      fontSize: 10,
                      fontFamily: "LatoBold",
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                  width: 150,
                  child: ColoredBox(
                    color: Color(0xFFECEDF3),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    elevation: 1,
                    backgroundColor: Color(0xFFF5F4F8),
                    minimumSize: Size(158, 70),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage("assets/images/google.png"),
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    backgroundColor: Color(0xFFF5F4F8),
                    minimumSize: Size(158, 70),
                  ),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage("assets/images/facebook.png"),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF53587A),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "LatoLight",
                    ),
                    children: [
                      TextSpan(
                        text: "Don’t have an account?  ",
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = openCreateAccountPage,
                        text: "Register",
                        style: const TextStyle(
                          color: Color(0xFF1F4C6B),
                          fontFamily: "LatoBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
