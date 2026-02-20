import 'package:expence_tracker/ui/account_page.dart';
import 'package:expence_tracker/ui/home/home_page.dart';
import 'package:expence_tracker/ui/search_page.dart';
import 'package:expence_tracker/ui/track_page.dart';
import 'package:expence_tracker/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  //pages
  final List<Widget> bottomBarPages = [
    HomePage(),
    SearchPage(),
    TrackPage(),
    AccountPage(),
  ];
  //pageIndex
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomBarPages[currentIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
