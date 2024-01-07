import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/models/showing_time.model.dart';
import 'package:legacy_cinema/utils/components/shared/button_style.comp.dart'
    as button;

Widget buildShowingWidget(Showing showing) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ElevatedButton(
        style: button.buttonPrimary,
        onPressed: () {},
        child: Text(
          showing.showingDate!.format('h:i A'),
        ),
      ),
      const Divider(),
    ],
  );
}
