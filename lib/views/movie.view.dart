import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/hall_comp.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
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
    return Scaffold(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TitleMovieComponent(
                              movie: controller
                                  .movieList[controller.movieIndex.toInt()]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          if (controller.showingTimeList.isNotEmpty) {
                            print(controller.showingTimeList.length);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  controller.showingTimeList.map((element) {
                                return Column(
                                  children: [
                                    ExpansionTile(
                                      initiallyExpanded: true,
                                      leading: Image.asset(
                                          'assets/image/${PublicUsed.isDark() ? 'light' : 'dark'}_logo.png',
                                          width: 50),
                                      title: Text(element.locationName),
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              element.halls.map<Widget>((hall) {
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
                            return const Expanded(
                              child: Center(
                                child: Text("No Showing Time Available"),
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
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Iconsax.arrow_circle_left,
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
    );
  }
}
