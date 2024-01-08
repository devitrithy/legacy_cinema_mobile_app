import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/models/showing_time.model.dart';
import 'package:legacy_cinema/utils/components/shared/button_style.comp.dart'
    as button;

Widget buildShowingWidget(Showing showing) {
  final HomeController controller = Get.put(HomeController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ElevatedButton(
        style: button.buttonPrimary,
        onPressed: () {
          controller.selectedSeatList.value = [];
          controller.showingId.value = showing.showingId.toString();
          controller.showingTime.value = showing;
          controller.fetchSeat(showing.showingId.toString());
          Get.toNamed('/select_seat');
        },
        child: Text(
          showing.showingDate!.format('h:i A'),
        ),
      ),
      const Divider(),
    ],
  );
}
