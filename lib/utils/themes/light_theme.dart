import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Color.fromARGB(179, 16, 16, 16)),
      foregroundColor: Color.fromRGBO(10, 10, 10, 1)),
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(224, 224, 224, 1),
    primary: Color.fromRGBO(10, 10, 10, 1),
    secondary: Color.fromRGBO(20, 20, 20, 0.498),
  ),
);
