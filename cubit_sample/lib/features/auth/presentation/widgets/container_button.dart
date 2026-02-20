import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final void Function() onTap;
  final String buttonName;
  final Color color;
  const ContainerButton({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(buttonName)),
      ),
    );
  }
}
