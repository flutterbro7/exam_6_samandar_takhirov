import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const CustomButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 63,
        width: 278,
        decoration: BoxDecoration(
          color: Color(0xFF8BC83F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}