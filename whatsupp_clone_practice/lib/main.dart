import 'package:flutter/material.dart';
import 'package:whatsupp_clone_practice/home/core/constrans/dark_mode.dart';
import 'package:whatsupp_clone_practice/home/features/presentation/pages/chat_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: themeData,
      debugShowCheckedModeBanner: false,
      home: ChatHome(),);
  }
}