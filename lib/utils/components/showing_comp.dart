import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/models/showingTime.model.dart';

Widget buildShowingWidget(Showing showing) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Showing ID: ${showing.showingId}'),
      Text('Movie ID: ${showing.movieId}'),
      Text('Showing Date: ${showing.showingDate}'),
      ElevatedButton(
        onPressed: () {},
        child: Text(
          showing.showingDate!.format('D, M h:i A'),
        ),
      ),
      // Add more widgets to display other movie showing details as needed
      const Divider(), // Add a divider between showings for better readability
    ],
  );
}
