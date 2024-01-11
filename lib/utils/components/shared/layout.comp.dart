import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/bottom_navigation_bar.comp.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/components/shared/switch_mode.dart';
import 'package:legacy_cinema/utils/public_used.dart';
import 'package:legacy_cinema/views/cinema.view.dart';
import 'package:legacy_cinema/views/history.view.dart';
import 'package:legacy_cinema/views/home.view.dart';
import 'package:legacy_cinema/views/setting.view.dart';
import 'package:lottie/lottie.dart';

class DefaultView extends StatelessWidget {
  DefaultView({super.key});
  final HomeController controller = Get.put(HomeController());
  final BottomNavigationBarController viewController =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              if (viewController.currentIndex.value == 0) return HomeView();
              if (viewController.currentIndex.value == 1) return CinemaView();
              if (viewController.currentIndex.value == 2) {
                return const HistoryView();
              }
              return const SettingView();
            }),
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
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.5),
                      border: const Border(
                        top: BorderSide(color: Colors.grey, width: 0.4),
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
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.5),
                      border: const Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.2),
                      ),
                    ),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: viewController.currentIndex.value == 0
                              ? AppBar(
                                  leading: ModeSwitch(
                                      isDark: PublicUsed.changeTheme()),
                                  title: LogoComponent(
                                      isDark: PublicUsed.isDark()),
                                  centerTitle: true,
                                  actions: [
                                    LanguageSwitch(
                                        isKhmer: PublicUsed.changeLanguage()),
                                  ],
                                )
                              : AppBar(
                                  title: Text(
                                    viewController
                                        .viewTitle[
                                            viewController.currentIndex.toInt()]
                                        .tr
                                        .toUpperCase(),
                                    style: TextStyle(
                                      letterSpacing:
                                          PublicUsed.isKhmer() ? 0 : 10,
                                    ),
                                  ),
                                  actions: [
                                    Obx(() {
                                      if (viewController.currentIndex == 1) {
                                        return Lottie.asset(
                                          "assets/animations/cinema.json",
                                          repeat: true,
                                          reverse: true,
                                          fit: BoxFit.contain,
                                        );
                                      } else if (viewController.currentIndex ==
                                          2) {
                                        return Lottie.asset(
                                          "assets/animations/ticket.json",
                                          repeat: true,
                                          reverse: true,
                                          height: 200,
                                          fit: BoxFit.contain,
                                        );
                                      } else {
                                        return Lottie.asset(
                                          "assets/animations/setting.json",
                                          repeat: true,
                                          reverse: true,
                                          height: 40,
                                          fit: BoxFit.contain,
                                        );
                                      }
                                    })
                                  ],
                                ),
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
