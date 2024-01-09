import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(child: const Center(child: Text("Setting")));
  }
}