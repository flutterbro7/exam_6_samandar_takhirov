import 'package:exam_6_samandar_takhirov/src/screens/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/number_text_field.dart';

class GetCodePage extends StatefulWidget {
  const GetCodePage({Key? key}) : super(key: key);

  @override
  State<GetCodePage> createState() => _GetCodePageState();
}

class _GetCodePageState extends State<GetCodePage> {
  void openLoginPage() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CustomText(
                pageNameLight: "Enter the ",
                pageNameBold: "code",
                comment: "Enter the 4 digit code that we just sent to",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "exam@modul6.com",
                style: const TextStyle(
                  color: Color(0xFF1F4C6B),
                  fontFamily: "LatoBold",
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberTextField(),
                NumberTextField(),
                NumberTextField(),
                NumberTextField(),
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
                        text: "Didn’t receive the OTP?  ",
                      ),
                      TextSpan(
                        text: "Resend OTP",
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
