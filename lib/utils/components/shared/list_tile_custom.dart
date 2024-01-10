// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
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
        child: Container(
          child: Row(
            children: [
              CachedNetworkImage(
                height: 160,
                imageUrl:
                    "${PublicUsed.apiEndPoint}/thumbnail/${movie.poster!.split('\\')[1]}?w=120&h=200",
                width: 99,
                placeholder: (context, url) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(child: TitleMovieComponent(movie: movie)),
              Center(
                child: TextButton(
                    onPressed: onTap, child: const Icon(Icons.info_outline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
