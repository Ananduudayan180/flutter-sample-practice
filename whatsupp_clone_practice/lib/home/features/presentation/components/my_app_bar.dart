import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //Dot button
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.more_horiz_sharp,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            //Camera
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            //Add button
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),

                child: Icon(Icons.add, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
