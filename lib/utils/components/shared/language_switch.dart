import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/public_used.dart';

// ignore: must_be_immutable
class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key, required this.isKhmer});
  final String isKhmer;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        PublicUsed.storage.write("lang", isKhmer);
        Get.updateLocale(Locale(isKhmer, isKhmer));
      },
      child: Text(
        PublicUsed.storage.read("lang") != "kh" ? "🇰🇭" : "🇺🇸",
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
