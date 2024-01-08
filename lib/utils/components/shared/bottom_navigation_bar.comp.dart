import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
            icon: const Icon(Icons.movie),
            label: "movie".tr,
            tooltip: "movie".tr),
        NavigationDestination(
            icon: const Icon(Iconsax.location), label: "cinema".tr),
        NavigationDestination(
            icon: const Icon(Iconsax.ticket), label: "history".tr),
        NavigationDestination(
            icon: const Icon(Iconsax.settings), label: "setting".tr),
      ],
    );
  }
}

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;
}
