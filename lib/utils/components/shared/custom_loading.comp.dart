import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Image(image: AssetImage("assets/image/custom_loading.gif")))
      ],
    );
  }
}
