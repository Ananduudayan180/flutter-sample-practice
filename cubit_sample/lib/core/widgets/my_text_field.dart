import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
