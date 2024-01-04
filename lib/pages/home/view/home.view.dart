import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/drawer.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/image/logo.png', height: 40),
        centerTitle: true,
      ),
      drawer: const DrawerComponent(),
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
