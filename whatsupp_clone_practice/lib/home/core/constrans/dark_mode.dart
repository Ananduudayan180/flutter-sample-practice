import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    //main green
    primary: Color(0xFF00A884),
    onPrimary: Color(0xFFE9EDEF),
    //text
    inversePrimary: Color(0xFF9AAAB5),
    onPrimaryContainer:Color.fromARGB(8, 255, 255, 255),
    //messege sent green color
    secondary: Color(0xFF005C4B),
    onSecondary: Color(0xFFE9EDEF),
    
    //error
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),
    //background
    surface: Color(0xFF0B141A),
    onSurface: Color(0xFFE9EDEF),
  ),
);
