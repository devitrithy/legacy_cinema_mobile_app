import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
        ),
        child: Center(
            child: Lottie.asset(
          "assets/animations/loading.json",
          repeat: true,
          height: 100,
          reverse: true,
          animate: true,
          frameRate: FrameRate(60),
          addRepaintBoundary: true,
        )),
      ),
    );
  }
}
