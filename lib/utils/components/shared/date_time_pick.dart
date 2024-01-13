// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class DateTimeComponent extends StatelessWidget {
  const DateTimeComponent({
    Key? key,
    required this.date,
    this.onTap,
    this.active = false,
  }) : super(key: key);
  final DateTime date;
  final Function()? onTap;
  final bool? active;

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
            color: active == true
                ? Colors.red.shade900.withOpacity(0.6)
                : Colors.transparent,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                7,
              ),
            ),
          ),
          child: Center(
            child: Text(
              DateTimeFormat.format(date, format: "d M").toString(),
              style: TextStyle(
                  color: PublicUsed.isDark()
                      ? active == true
                          ? Colors.white
                          : Colors.black
                      : Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
