// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    Key? key,
    this.width = 100,
    required this.isDark,
  }) : super(key: key);
  final double width;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/image/${isDark ? 'light' : 'dark'}_logo.png',
        width: width);
  }
}
