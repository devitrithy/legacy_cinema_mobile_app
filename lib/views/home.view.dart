import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
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
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.black45,
          ),
        ),
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
      body: RefreshIndicator(
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
            return Column(
              children: [
                SlideshowWidget(controller: controller),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.movieList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.movieList[index].title),
                        onTap: () {
                          controller.movieId = controller.movieList[index].id;
                          Get.toNamed('/movie_detail');
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
