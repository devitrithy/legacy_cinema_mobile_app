// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/models/movie.model.dart';
import 'package:legacy_cinema/utils/components/shared/text_icon.comp.dart';

class TitleMovieComponent extends StatelessWidget {
  const TitleMovieComponent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title.toString(),
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextIcon(
                  icon: Icons.movie_filter, text: movie.genre.toString().tr),
              TextIcon(
                  icon: Icons.date_range,
                  text: DateTimeFormat.format(movie.releaseDate!,
                      format: "D M Y")),
              TextIcon(
                text: "${movie.time} ${'minute'.tr}",
                icon: Icons.timer,
              ),
            ],
          ),
          const TextIcon(icon: Icons.attach_money_rounded, text: "5"),
        ],
      ),
    );
  }
}
