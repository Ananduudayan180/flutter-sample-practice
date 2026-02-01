import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter_demo/controller/counter_controller.dart';

class SecondPage extends StatelessWidget {
  final CounterController c = Get.find<CounterController>();
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(child: Text(c.count.toString())),
    );
  }
}
