// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:legacy_cinema/utils/public_used.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    Key? key,
    this.width = 100,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/image/${PublicUsed.isDark() ? 'light' : 'dark'}_logo.png',
        width: width);
  }
}
