import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyListview extends StatelessWidget {
  const MyListview({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Expanded(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          final dateTime = DateTime.now();
          final date = DateFormat('h:mm a').format(dateTime);
          return ListTile(
            leading: CircleAvatar(radius: 25),
            title: Text('User'),
            subtitle: Text(
              'Hi bro how are you!',
              style: TextStyle(color: colors.inversePrimary),
            ),
            trailing: Text(
              date,
              style: TextStyle(color: colors.inversePrimary),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: 78, color: Colors.white24, thickness: 0.3);
        },
      ),
    );
  }
}
