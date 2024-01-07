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
            Image.network(
              "https://img.youtube.com/vi/${controller.movieList[controller.movieIndex.toInt()].trailer}/hqdefault.jpg",
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
