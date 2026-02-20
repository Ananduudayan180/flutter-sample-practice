import 'package:expence_tracker/theme/app_colors.dart';
import 'package:expence_tracker/app_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: GoogleFonts.outfitTextTheme().apply(
          bodyColor: AppColors.text,
        ),
      ),
      home: AppRoute(),
    );
  }
}
