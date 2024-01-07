// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //         'assets/image/bg-${PublicUsed.isDark() ? "light" : "dark"}.png'), // Replace with your image path
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: child,
    );
  }
}