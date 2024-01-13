// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;

  final String title;

  final DateTime releaseDate;

  const MovieCard({
    Key? key,
    required this.image,
    required this.title,
    required this.releaseDate,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.7),
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                            ),
                            Text(
                              DateTimeFormat.format(releaseDate,
                                  format: "d M Y"),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/image/buyticket.png", width: 100),
                          Text(
                            "Buy Ticket",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
