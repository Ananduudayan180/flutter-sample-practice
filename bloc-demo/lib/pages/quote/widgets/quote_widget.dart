import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final String quote;
  const QuoteWidget({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(height: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: Text(quote)),
        ),
      ),
    );
  }
}
