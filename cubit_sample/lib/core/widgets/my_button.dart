import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const MyButton({super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(child: Text(buttonName)),
      ),
    );
  }
}
