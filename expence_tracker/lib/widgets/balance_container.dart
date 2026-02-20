import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  final Color color;
  const BalanceContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today', style: TextStyle(fontSize: 20)),
            Text('\$200', style: TextStyle(fontSize: 30)),
            Text('This Month', style: TextStyle(fontSize: 20)),
            Text('\$12500', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
