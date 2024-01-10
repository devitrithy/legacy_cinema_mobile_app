import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:legacy_cinema/views/cinema.view.dart';
import 'package:legacy_cinema/views/history.view.dart';
import 'package:legacy_cinema/views/home.view.dart';
import 'package:legacy_cinema/views/setting.view.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  final BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.transparent,
      height: 80,
      elevation: 0,
      selectedIndex: controller.currentIndex.value,
      onDestinationSelected: (value) => setState(() {
        controller.currentIndex.value = value;
      }),
      destinations: [
        NavigationDestination(
            icon: const Icon(Icons.movie_filter_outlined),
            label: "movie".tr,
            tooltip: "movie".tr),
        NavigationDestination(
            icon: const Icon(Iconsax.location),
            label: "cinema".tr.toUpperCase()),
        NavigationDestination(
            icon: const Icon(Iconsax.ticket), label: "ticket".tr.toUpperCase()),
        NavigationDestination(
            icon: const Icon(Iconsax.setting4),
            label: "setting".tr.toUpperCase()),
      ],
    );
  }
}

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;
  var view = [HomeView(), CinemaView(), HistoryView(), SettingView()];
  var viewTitle = ["movies", "cinema", "ticket", "setting"];
}
