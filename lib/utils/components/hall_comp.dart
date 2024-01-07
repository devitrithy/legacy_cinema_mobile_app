import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/models/hall.model.dart';
import 'package:legacy_cinema/utils/components/showing_comp.dart';

Widget buildHallWidget(Hall hall) {
  final HomeController controller = Get.put(HomeController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${hall.hallName!}"),
        const SizedBox(height: 10),
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
      ],
    ),
  );
}
