import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home_page.dart';
import 'package:provider_demo/provider/number_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return NumberListProvider();
      },
      child: MaterialApp(title: 'Flutter Provider Demo', home: HomePage()),
    );
  }
}
