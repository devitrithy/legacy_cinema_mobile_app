import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legacy_cinema/views/home.view.dart';
import 'package:legacy_cinema/views/login.view.dart';
import 'package:legacy_cinema/views/register.view.dart';
import 'package:legacy_cinema/utils/themes/dark_theme.dart';
import 'package:legacy_cinema/utils/themes/light_theme.dart';
import 'package:legacy_cinema/utils/language.dart';
import 'package:legacy_cinema/utils/public_used.dart';

void main() async {
  await GetStorage.init();
  bool isKhmer = PublicUsed.isKhmer();
  bool isDark = PublicUsed.isDark();
  Locale lang = isKhmer ? const Locale("kh", "KH") : const Locale("en", "US");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
      darkTheme: darkTheme,
      translations: Language(),
      locale: lang,
      fallbackLocale: const Locale("en", "US"),
      initialRoute: PublicUsed.checkToken() ? '/home' : '/login',
      routes: {
        '/home': (p0) => HomeView(),
        "/login": (p0) => LoginView(),
        "/register": (p0) => RegisterView(),
      },
    ),
  );
}
