import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isObscure;
  final String hintText;
  final String imagePath;
  final String? prefixText;
  final TextInputAction inputAction;
  final String? Function(String? value) validator;
  final void Function(String value)? onChange;
  final TextEditingController? controller;

  const CustomTextField({
    required this.hintText,
    required this.imagePath,
    required this.validator,
    this.prefixText,
    this.controller,
    this.inputAction = TextInputAction.next,
    this.isObscure,
    this.onChange,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = widget.isObscure;
  }

  void changeObscure() {
    if (showPassword != null) {
      setState(() => showPassword = !showPassword!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: showPassword ?? false,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: widget.inputAction,
          validator: widget.validator,
          onChanged: widget.onChange,
          style: TextStyle(
            color: Color(0xFF252B5C),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF5F4F8),
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            hintText: widget.hintText,
            errorMaxLines: 2,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: Image(
              height: 50,
              width: 50,
              image: AssetImage(widget.imagePath),
            ),
          ),
        ),
        SizedBox(height: 10),
        widget.prefixText != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.prefixText!,
                    style: TextStyle(
                      color: Color(0xFF1F4C6B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: changeObscure,
                    child: Text(
                      showPassword! ? "Show password" : "Hide password",
                      style: TextStyle(
                        color: Color(0xFF1F4C6B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
