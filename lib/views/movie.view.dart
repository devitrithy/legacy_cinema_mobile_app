import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/hall_comp.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/date_time_pick.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/components/shared/title_movie.comp.dart';
import 'package:legacy_cinema/utils/components/trailer.comp.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class MovieView extends StatelessWidget {
  MovieView({
    Key? key,
  }) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.activeDate.value = DateTime.now().day;
        controller.selectedImage.value = "";
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Background(
          child: Obx(() {
            if (controller.isLoading.isFalse) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TrailerComponent(controller: controller),
                          Container(
                            decoration: BoxDecoration(
                                color: PublicUsed.isDark()
                                    ? Colors.transparent
                                    : Colors.black.withOpacity(0.6)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                          width: 100,
                                          height: 200,
                                          imageUrl:
                                              "${PublicUsed.apiEndPoint}/${controller.movieList[controller.movieIndex.toInt()].poster}"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TitleMovieComponent(
                                        movie: controller.movieList[
                                            controller.movieIndex.toInt()],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: controller.listOfDate
                                        .asMap()
                                        .entries
                                        .map<Widget>(
                                      (entry) {
                                        var index = entry.key;
                                        return DateTimeComponent(
                                            active: controller.activeDate ==
                                                controller
                                                    .listOfDate[index].day,
                                            date: controller.listOfDate[index],
                                            onTap: () async {
                                              controller.activeDate.value =
                                                  controller
                                                      .listOfDate[index].day;

                                              controller.fetchLocations(
                                                controller
                                                    .listOfDate[index].day,
                                              );
                                            });
                                      },
                                    ).toList(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Obx(() {
                            if (controller.showingTimeList.isNotEmpty) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    controller.showingTimeList.map((element) {
                                  return Column(
                                    children: [
                                      ExpansionTile(
                                        initiallyExpanded: true,
                                        leading: LogoComponent(
                                            isDark: PublicUsed.isDark(),
                                            width: 50),
                                        title: Text(element.locationName),
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: element.halls
                                                .map<Widget>((hall) {
                                              if (hall.showing.length > 0) {
                                                return buildHallWidget(hall);
                                              } else {
                                                return Container();
                                              }
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                              );
                            } else {
                              return Container(
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/image/no_showing_time_2.png',
                                      height: 200,
                                    ),
                                    Center(
                                      child: Text(
                                        "No Showing Time Available"
                                            .tr
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        controller.selectedImage.value = "";
                        controller.activeDate.value = DateTime.now().day;
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Iconsax.arrow_circle_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
