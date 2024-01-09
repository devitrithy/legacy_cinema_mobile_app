import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';

class SeatComponent extends StatefulWidget {
  const SeatComponent({
    Key? key,
    this.isAvaialble = true,
    required this.seat,
    required this.controller,
  }) : super(key: key);
  final bool isAvaialble;
  final String seat;
  final HomeController controller;

  @override
  State<SeatComponent> createState() => _SeatComponentState();
}

class _SeatComponentState extends State<SeatComponent> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isAvaialble) {
          return;
        } else {
          setState(() {
            isSelect = !isSelect;
          });
        }
        if (!isSelect) {
          widget.controller.selectedSeatList.remove(widget.seat);
        } else {
          widget.controller.selectedSeatList.add(widget.seat);
        }
      },
      child: Stack(alignment: Alignment.center, children: [
        Icon(
          color: isSelect
              ? Colors.green
              : widget.isAvaialble
                  ? Color.fromARGB(255, 75, 75, 75)
                  : Colors.red,
          Icons.chair,
          size: 15,
        ),
        Text(
          widget.seat,
          style: const TextStyle(
            fontSize: 5,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
