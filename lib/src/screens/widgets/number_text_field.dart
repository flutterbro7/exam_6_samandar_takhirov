import 'package:flutter/material.dart';

class NumberTextField extends StatefulWidget {
  const NumberTextField({Key? key}) : super(key: key);

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 70,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFF5F4F8),
          border: Border.all(
            color: Color(0xFF234F68),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: TextField(
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF252B5C),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
