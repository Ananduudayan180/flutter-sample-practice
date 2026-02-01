import 'package:api_integration_sample/apis.dart';
import 'package:api_integration_sample/number_fact_resp/number_fact_resp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _controller = TextEditingController();
  NumberFactResp? data;
  String? jsonTitle = 'Json Title Shown Here';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                  ),
                ),
              ),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      data = await numberFactResp(number: _controller.text);
                      setState(() {
                        jsonTitle = data?.title;
                      });
                    },
                    child: Text('Result'),
                  ),
                ],
              ),
              Text(jsonTitle ?? 'No Data'),
            ],
          ),
        ),
      ),
    );
  }
}
