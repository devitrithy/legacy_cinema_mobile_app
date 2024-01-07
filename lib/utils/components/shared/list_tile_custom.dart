// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:legacy_cinema/models/movie.model.dart';
import 'package:legacy_cinema/utils/components/shared/title_movie.comp.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class ListTileCustome extends StatelessWidget {
  const ListTileCustome({
    Key? key,
    required this.movie,
    this.onTap,
  }) : super(key: key);
  final MovieModel movie;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Image.network(
              "${PublicUsed.apiEndPoint}/thumbnail/${movie.poster!.split('\\')[1]}?w=120&h=200",
              width: 99,
            ),
            const SizedBox(
              width: 9,
            ),
            TitleMovieComponent(movie: movie),
            Expanded(
              child: Center(
                child: TextButton(
                    onPressed: onTap, child: const Icon(Icons.info_outline)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
