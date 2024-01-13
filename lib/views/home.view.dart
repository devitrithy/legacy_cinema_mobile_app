// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/movie_card.dart';
import 'package:legacy_cinema/utils/components/slideshow.comp.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (controller.movieList.isEmpty) {
            Get.toNamed('/login');
          }
          return Background(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.fetchData();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Container(
                      height: 90,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SlideshowWidget(controller: controller),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "now_showing".tr.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 10,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverGrid.builder(
                      itemCount: controller.movieList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 270,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.movieIndex.value = index;
                            controller.selectedImage.value =
                                controller.movieList[index].poster;
                            Get.toNamed('/movie_detail');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                imageUrl:
                                    "${PublicUsed.apiEndPoint}/${controller.movieList[index].poster}",
                              ),
                              Text(
                                DateTimeFormat.format(
                                    controller.movieList[index].releaseDate,
                                    format: "d M Y"),
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 10),
                              ),
                              Text(
                                controller.movieList[index].title
                                    .toString()
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
