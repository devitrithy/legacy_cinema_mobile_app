import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class ModeSwitch extends StatelessWidget {
  const ModeSwitch({super.key, required this.isDark});
  final String isDark;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        PublicUsed.storage.write("darkMode", isDark);
        Get.changeThemeMode(
            isDark != "dark" ? ThemeMode.dark : ThemeMode.light);
      },
      child: Icon(isDark == "dark" ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
