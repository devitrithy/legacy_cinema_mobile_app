import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/models/showing_time.model.dart';

Widget buildShowingWidget(Showing showing) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.red.shade500),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        ),
        onPressed: () {},
        child: Text(
          showing.showingDate!.format('h:i A'),
        ),
      ),
      // Add more widgets to display other movie showing details as needed
      const Divider(), // Add a divider between showings for better readability
    ],
  );
}
