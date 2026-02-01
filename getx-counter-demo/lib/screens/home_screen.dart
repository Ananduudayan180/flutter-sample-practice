import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_counter_demo/controller/counter_controller.dart';
import 'package:getx_counter_demo/screens/second_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CounterController c = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              c.increment();
            },
            heroTag: 'add',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              c.decrement();
            },
            heroTag: 'remove',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              c.reset();
            },
            heroTag: 'reset',
            child: Icon(Icons.delete),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('GetX Demo'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Obx(() => Text('Clicks: ${c.count}'))),
          ElevatedButton(
            onPressed: () {
              Get.to(SecondPage());
            },
            child: Text('Go to Second Page'),
          ),
        ],
      ),
    );
  }
}
