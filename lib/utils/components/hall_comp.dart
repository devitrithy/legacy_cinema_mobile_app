import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/models/hall.model.dart';
import 'package:legacy_cinema/utils/components/showing_comp.dart';

Widget buildHallWidget(Hall hall) {
  final HomeController controller = Get.put(HomeController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Hall ID: ${hall.hallId}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text('Hall Name: ${hall.hallName}'),
      // Add more widgets to display other hall details as needed

      const SizedBox(height: 10),

      const Text(
        'Movie Showings:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: hall.showing!.map<Widget>((showing) {
          if (showing.movieId ==
              controller.movieList[controller.movieIndex.toInt()].movieId) {
            return buildShowingWidget(showing);
          } else {
            return Container();
          }
        }).toList(),
      ),
      const Divider(), // Add a divider between halls for better readability
    ],
  );
}
