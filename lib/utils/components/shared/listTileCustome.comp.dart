import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/models/movie.model.dart';
import 'package:legacy_cinema/utils/components/shared/text_icon.comp.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class ListTileCustome extends StatelessWidget {
  const ListTileCustome({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Row(
          children: [
            Image.network(
              "${PublicUsed.apiEndPoint}/${movie.poster}",
              width: 99,
            ),
            const SizedBox(
              width: 9,
            ),
            Container(
              height: 149,
              width: 199,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextIcon(
                          icon: Icons.movie_filter,
                          text: movie.genre.toString()),
                      TextIcon(
                          icon: Icons.date_range,
                          text: DateTimeFormat.format(movie.releaseDate!,
                              format: "D M Y")),
                      TextIcon(
                        text: "${movie.time} Minutes",
                        icon: Icons.timer,
                      ),
                    ],
                  ),
                  const TextIcon(icon: Icons.attach_money, text: "4\$"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
