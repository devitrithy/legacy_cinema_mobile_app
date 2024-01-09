// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/list_tile_custom.dart';
import 'package:legacy_cinema/utils/components/slideshow.comp.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Background(
      moviePosterBg: false,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.fetchData();
        },
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.movieList.isEmpty) {
              Get.toNamed('/login');
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideshowWidget(controller: controller),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("now_showing".tr.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children:
                          controller.movieList.asMap().entries.map((entry) {
                        final index = entry.key;
                        final movie = entry.value;

                        return ListTileCustome(
                          onTap: () {
                            // Use index here
                            controller.selectedImage.value = movie.poster!;
                            controller.movieIndex.value = index;
                            controller.fetchLocations();
                            Get.toNamed('/movie_detail');
                          },
                          movie: movie,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
