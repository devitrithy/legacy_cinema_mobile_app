import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/bottom_navigation_bar.comp.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/components/shared/switch_mode.dart';
import 'package:legacy_cinema/utils/public_used.dart';
import 'package:legacy_cinema/views/home.view.dart';

class DefaultView extends StatelessWidget {
  DefaultView({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            HomeView(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY:
                          15), // Adjust sigmaX and sigmaY for blur intensity
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.1),
                      ),
                    ),
                    child: const BottomNavigationBarComponent(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY:
                          15), // Adjust sigmaX and sigmaY for blur intensity
                  child: Container(
                    height: 80, // Adjust height for the AppBar-like widget
                    color: Colors.transparent, // Adjust color if needed
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppBar(
                          leading: ModeSwitch(isDark: PublicUsed.changeTheme()),
                          title: LogoComponent(isDark: PublicUsed.isDark()),
                          centerTitle: true,
                          actions: [
                            LanguageSwitch(
                                isKhmer: PublicUsed.changeLanguage()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
