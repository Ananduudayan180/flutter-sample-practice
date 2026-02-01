import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/number_list_provider.dart';
import 'package:provider_demo/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            backgroundColor: Colors.green,
            title: const Text('Home Page'),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SecondPage()));
                },
              ),
            ],
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
