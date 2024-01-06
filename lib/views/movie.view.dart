import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/models/showingTime.model.dart';

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
      body: Obx(() {
        return ListView(
          children: [
            Container(
              height: 200,
            ),
            Text(controller.movieList[controller.movieIndex.toInt()].title!),
            Text(controller.movieList[controller.movieIndex.toInt()].genre!),
            Text(controller.movieList[controller.movieIndex.toInt()].time!),
            Text(controller.movieList[controller.movieIndex.toInt()].releaseDate
                .toString()),
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
              if (controller.isLoading.isTrue) {
                return const CircularProgressIndicator();
              } else {
                if (controller.showingTimeList.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.showingTimeList.map((element) {
                      return Column(
                        children: [
                          ExpansionTile(
                            title: Text(element.locationName),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: element.halls
                                    .map<Widget>(
                                        (hall) => buildHallWidget(hall))
                                    .toList(),
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
              }
            }),
          ],
        );
      }),
    );
  }

  Widget buildHallWidget(Hall hall) {
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

  Widget buildShowingWidget(Showing showing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Showing ID: ${showing.showingId}'),
        Text('Movie ID: ${showing.movieId}'),
        Text('Showing Date: ${showing.showingDate}'),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            showing.showingDate!.format('h:i A'),
          ),
        ),
        // Add more widgets to display other movie showing details as needed
        const Divider(), // Add a divider between showings for better readability
      ],
    );
  }
}
