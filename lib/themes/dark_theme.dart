import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white70),
  ),
  colorScheme: const ColorScheme.dark(
      background: Color.fromRGBO(17, 24, 39, 1),
      primary: Color.fromRGBO(255, 255, 255, 1),
      secondary: Color.fromRGBO(255, 255, 255, 0.5),
      surface: Color.fromRGBO(199, 43, 43, 1)),
);
