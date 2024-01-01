import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legacy_cinema/pages/home/view/home.view.dart';
import 'package:legacy_cinema/pages/login/view/login.view.dart';
import 'package:legacy_cinema/pages/register/view/register.view.dart';
import 'package:legacy_cinema/themes/dark_theme.dart';
import 'package:legacy_cinema/themes/light_theme.dart';
import 'package:legacy_cinema/utils/language.dart';
import 'package:legacy_cinema/utils/public_used.dart';

void main() async {
  await GetStorage.init();
  Locale lang = PublicUsed.storage.read("lang") == "kh"
      ? const Locale("kh", "KH")
      : const Locale("en", "US");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      translations: Language(),
      locale: lang,
      fallbackLocale: const Locale("en", "US"),
      initialRoute: PublicUsed.storage.read(PublicUsed.token) != null
          ? '/home'
          : '/login',
      routes: {
        '/home': (p0) => const HomeView(),
        "/login": (p0) => LoginView(),
        "/register": (p0) => RegisterView(),
      },
    ),
  );
}
