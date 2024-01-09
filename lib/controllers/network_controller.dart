import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus;
    });
    super.onInit();
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    print("no Internet");
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          "No Connections Available.",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.black54,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
