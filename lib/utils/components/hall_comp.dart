import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/models/hall.model.dart';
import 'package:legacy_cinema/utils/components/showing_comp.dart';

Widget buildHallWidget(Hall hall) {
  final HomeController controller = Get.put(HomeController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      children: [
        const SizedBox(
          width: 65,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hall.hallName!.toUpperCase()),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: hall.showing!.asMap().entries.map<Widget>((entry) {
                final showing = entry.value;

                if (showing.movieId ==
                        controller
                            .movieList[controller.movieIndex.toInt()].movieId &&
                    showing.showingDate!.isAfter(DateTime.now())) {
                  return buildShowingWidget(showing);
                } else {
                  return const SizedBox();
                }
              }).toList(),
            ),
          ],
        ),
      ],
    ),
  );
}
