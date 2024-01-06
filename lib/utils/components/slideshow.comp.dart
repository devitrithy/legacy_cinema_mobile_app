import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideshowWidget extends StatelessWidget {
  const SlideshowWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 100,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 2),
            animateToClosest: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              controller.currentSlideshowIndex.value = index;
            },
          ),
          items: controller.slideshowList,
        ),
        Obx(() {
          return AnimatedSmoothIndicator(
            activeIndex: controller.currentSlideshowIndex.value,
            effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Colors.grey.shade600,
                activeDotColor: Colors.red.shade400),
            count: controller.slideshowList.length,
          );
        }),
      ],
    );
  }
}
