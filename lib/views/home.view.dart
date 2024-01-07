// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
import 'package:legacy_cinema/utils/components/shared/list_tile_custom.dart';
import 'package:legacy_cinema/utils/components/slideshow.comp.dart';
import 'package:legacy_cinema/utils/drawer.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _isKhmer = PublicUsed.changeLanguage();
  final bool _isDark = PublicUsed.isDark();
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: Image.asset(
            'assets/image/${!_isDark ? 'dark' : 'light'}_logo.png',
            height: 40),
        centerTitle: true,
        actions: [
          LanguageSwitch(isKhmer: _isKhmer),
        ],
      ),
      // ignore: prefer_const_constructors
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Background(
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
                child: Column(
                  children: [
                    SlideshowWidget(controller: controller),
                    Column(
                      children:
                          controller.movieList.asMap().entries.map((entry) {
                        final index = entry.key;
                        final movie = entry.value;

                        return ListTileCustome(
                          onTap: () {
                            // Use index here
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
              );
            }
          }),
        ),
      ),
    );
  }
}
