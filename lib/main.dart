import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legacy_cinema/controllers/dependency_injection.dart';
import 'package:legacy_cinema/utils/components/shared/layout.comp.dart';
import 'package:legacy_cinema/views/booking_ticket.view.dart';
import 'package:legacy_cinema/views/login.view.dart';
import 'package:legacy_cinema/views/movie.view.dart';
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
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51MlBeALmuduO7w8mZ14CKOsSInmnHeU3iDtkIJvZ4EORK0U1JlSspP28fF9zcEemBRkRftu87CCVHk9RKJAqtQWd00VhKt5Xv1';

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      getPages: [
        GetPage(name: '/home', page: () => DefaultView()),
        GetPage(name: "/login", page: () => LoginView()),
        GetPage(name: "/register", page: () => RegisterView()),
        GetPage(name: "/movie_detail", page: () => MovieView()),
        GetPage(name: "/select_seat", page: () => SelectingSeatView()),
      ],
    ),
  );
}
