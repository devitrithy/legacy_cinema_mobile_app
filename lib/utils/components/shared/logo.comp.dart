import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/image/${PublicUsed.isDark() ? 'light' : 'dark'}_logo.png',
        width: 100);
  }
}
