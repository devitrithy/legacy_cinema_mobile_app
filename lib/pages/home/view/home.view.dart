import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            PublicUsed.storage.remove(PublicUsed.token);
            Get.offNamed('/login');
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
