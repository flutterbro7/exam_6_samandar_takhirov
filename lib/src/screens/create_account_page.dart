import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'get_code_page.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_text_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String email = "exam@modul6.com";
  final String password = "Modul6exam";

  String? validateName(String? value) {
    if (value != null && value.length < 3) {
      return "Name invalid";
    }

    return null;
  }

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

  void openLoginPage() => Navigator.pop(context);

  void openGetCodePage() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GetCodePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: IconButton(
                  onPressed: openLoginPage,
                  icon: SizedBox(
                    height: 50,
                    width: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFD7D7D7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(CupertinoIcons.back),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: CustomText(
                  pageNameLight: "Create your ",
                  pageNameBold: "account",
                  comment: "quis nostrud exercitation ullamco laboris nisi ut",
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomTextField(
                  hintText: "Full name",
                  imagePath: "assets/images/Profile.png",
                  validator: validateName,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomTextField(
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
                  prefixText: "Terms of service",
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: CustomButton(
                    onTap: openGetCodePage,
                    text: "Register",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
