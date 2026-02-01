import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter_demo/controller/counter_controller.dart';
import 'package:getx_counter_demo/screens/home_screen.dart';

void main() {
 Get.put(CounterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
  }
}
