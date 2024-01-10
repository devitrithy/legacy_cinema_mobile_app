import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:lottie/lottie.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: Lottie.asset(
          "assets/animations/ticket.json",
          repeat: true,
          reverse: true,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
