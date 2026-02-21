import 'package:flutter/material.dart';
import 'package:whatsupp_clone_practice/home/features/presentation/components/my_app_bar.dart';
import 'package:whatsupp_clone_practice/home/features/presentation/components/my_listview.dart';
import 'package:whatsupp_clone_practice/home/features/presentation/components/my_text_field.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      //backgroundColor
      backgroundColor: Theme.of(context).colorScheme.surface,

      //AppBar
      appBar: MyAppBar(),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top Chat Text
              Text(
                'Chats',
                style: TextStyle(
                  color: colors.inversePrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Search container
              MyTextField(),
              //Chat List
              MyListview(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: colors.inversePrimary,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: colors.inversePrimary),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Communities',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'You'),
        ],
      ),
    );
  }
}
