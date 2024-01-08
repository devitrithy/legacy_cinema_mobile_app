// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class Background extends StatelessWidget {
  Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.selectedImage.isEmpty) {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/image/bg-${!PublicUsed.isDark() ? 'dark' : 'light'}.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(child: child),
        );
      } else {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "${PublicUsed.apiEndPoint}/${controller.selectedImage.value}"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 50, sigmaY: 50), // Adjust blur intensity
            child: Container(
              color: Colors.black
                  .withOpacity(0.3), // Adjust overlay color and opacity
              child: SafeArea(child: child),
            ),
          ),
        );
      }
    });
  }
}
