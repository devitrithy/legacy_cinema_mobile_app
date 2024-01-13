import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/public_used.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white70),
    foregroundColor: Colors.white70,
  ),
  fontFamily: PublicUsed.isKhmer() ? "DaunTeav" : "Quicksand",
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(17, 24, 39, 1),
    primary: Color.fromRGBO(255, 255, 255, 1),
    secondary: Color.fromRGBO(255, 255, 255, 0.5),
    surface: Color.fromRGBO(199, 43, 43, 1),
  ),
);
