import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String pageNameLight;
  final String pageNameBold;
  final String comment;

  const CustomText({
    required this.pageNameLight,
    required this.pageNameBold,
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Color(0xFF252B5C),
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: "LatoLight",
            ),
            children: [
              TextSpan(
                text: pageNameLight,
              ),
              TextSpan(
                text: pageNameBold,
                style: const TextStyle(
                  color: Color(0xFF1F4C6B),
                  fontFamily: "LatoBold",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          comment,
          style: const TextStyle(
            color: Color(0xFF53587A),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: "LatoLight",
          ),
        ),
      ],
    );
  }
}
