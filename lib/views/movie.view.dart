import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:date_time_format/date_time_format.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/hall_comp.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';

class MovieView extends StatelessWidget {
  MovieView({
    Key? key,
  }) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(controller.movieList[controller.movieIndex.toInt()].title!),
      ),
      body: Background(
        child: Obx(() {
          if (controller.isLoading.isFalse) {
            return ListView(
              children: [
                Container(
                  height: 200,
                ),
                Text(
                    controller.movieList[controller.movieIndex.toInt()].title!),
                Text(
                    controller.movieList[controller.movieIndex.toInt()].genre!),
                Text(controller.movieList[controller.movieIndex.toInt()].time!),
                Text(DateTimeFormat.format(
                    controller
                        .movieList[controller.movieIndex.toInt()].releaseDate,
                    format: "d-M-Y")),
                const Divider(),
                DropdownButton<String>(
                  value: controller.selectOptionLocation.value,
                  items: controller.locationList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    //
                    if (value != null) {
                      controller.selectOptionLocation.value = value;
                      debugPrint(value);
                    }
                  },
                ),
                Obx(() {
                  if (controller.showingTimeList.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.showingTimeList.map((element) {
                        return Column(
                          children: [
                            ExpansionTile(
                              initiallyExpanded: true,
                              leading: const Icon(Icons.home),
                              title: Text(element.locationName),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: element.halls.map<Widget>((hall) {
                                    if (hall.showing.length > 0) {
                                      return buildHallWidget(hall);
                                    } else {
                                      return Container();
                                    }
                                  }).toList(),
                                ),
                              ],
                            ),
                            const Divider(),
                          ],
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: Text("No Showing Time Available"),
                    );
                  }
                }),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
