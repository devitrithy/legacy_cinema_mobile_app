// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class DateTimeComponent extends StatelessWidget {
  const DateTimeComponent({
    Key? key,
    required this.date,
    this.onTap,
  }) : super(key: key);
  final DateTime date;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(7),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Center(
            child: Text(
              DateTimeFormat.format(date, format: "d M Y").toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
