import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
import 'package:legacy_cinema/utils/drawer.dart';
import 'package:legacy_cinema/utils/public_used.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  var isKhmer = PublicUsed.changeLanguage();
  bool isDark = PublicUsed.isDark();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            'assets/image/${!isDark ? 'dark' : 'light'}_logo.png',
            height: 40),
        centerTitle: true,
        actions: [
          LanguageSwitch(isKhmer: isKhmer),
        ],
      ),
      drawer: DrawerComponent(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            PublicUsed.storage.remove(PublicUsed.token);
            Get.offNamed('/login');
          },
          child: Text(
            "logout".tr,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );
  }
}
