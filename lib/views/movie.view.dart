import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/hall_comp.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/title_movie.comp.dart';
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
      appBar: AppBar(
        title: Text(controller.movieList[controller.movieIndex.toInt()].title!),
      ),
      body: Background(
        child: Obx(() {
          if (controller.isLoading.isFalse) {
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 270,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              "https://img.youtube.com/vi/${controller.movieList[controller.movieIndex.toInt()].trailer}/hqdefault.jpg",
                              width: 500,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.play_circle, size: 50),
                                label: const Text("")),
                          ],
                        ),
                      ),
                    ),
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
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButton<String>(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        dropdownColor: Colors.black87,
                        isExpanded: true,
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
                    ),
                    const SizedBox(
                      height: 20,
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
                                const Divider(),
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
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
