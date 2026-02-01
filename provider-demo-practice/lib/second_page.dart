import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/number_list_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (BuildContext context, numberListProvider, Widget? child) {
        return Scaffold(
          //fab
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              numberListProvider.addNumbers();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Second Page'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Count: ${numberListProvider.numbers.last}'),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          numberListProvider.numbers[index].toString(),
                        ),
                      );
                    },
                    itemCount: numberListProvider.numbers.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
