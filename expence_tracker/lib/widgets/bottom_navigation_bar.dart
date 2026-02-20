import 'package:expence_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int)? onTap;
  final int currentIndex;
  const MyBottomNavigationBar({
    super.key,
    required this.onTap,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            unselectedItemColor: AppColors.text,
            selectedItemColor: AppColors.pink,
            currentIndex: currentIndex,
            backgroundColor: AppColors.primary,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.paid), label: 'Track'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'You',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
