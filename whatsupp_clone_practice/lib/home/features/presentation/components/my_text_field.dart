import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color
        color: colors.onPrimaryContainer,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: 'Search',
          hintStyle: TextStyle(color: colors.inversePrimary),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.search, color: colors.inversePrimary),
        ),
      ),
    );
  }
}
