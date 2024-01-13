import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/services/location.service.dart';

class CinemaController extends GetxController {
  var locationList = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchLocation();
    super.onInit();
  }

  void fetchLocation() async {
    isLoading.value = true;
    try {
      var res = await HttpService.fetchLocations();
      if (res == 401) {
        Get.offNamed('/login');
        return;
      }
      locationList.value = res;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
