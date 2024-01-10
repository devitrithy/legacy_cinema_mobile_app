import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';

class TrailerComponent extends StatelessWidget {
  const TrailerComponent({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://img.youtube.com/vi/${controller.movieList[controller.movieIndex.toInt()].trailer}/hqdefault.jpg",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              width: 500,
              height: 400,
              fit: BoxFit.cover,
            ),
            TextButton.icon(
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                icon: const Icon(Icons.play_circle, size: 50),
                label: const Text("")),
          ],
        ),
      ),
    );
  }
}
