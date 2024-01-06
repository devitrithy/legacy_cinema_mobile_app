import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 30,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 120, 120, 120),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}
