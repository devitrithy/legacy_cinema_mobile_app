import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';

class SeatComponent extends StatefulWidget {
  const SeatComponent({
    Key? key,
    this.isAvaialble = true,
    required this.seat,
  }) : super(key: key);
  final bool isAvaialble;
  final String seat;

  @override
  State<SeatComponent> createState() => _SeatComponentState();
}

class _SeatComponentState extends State<SeatComponent> {
  bool isSelect = false;
  final HomeController controller = Get.put(HomeController());

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
          controller.selectedSeatList.remove(widget.seat);
        } else {
          controller.selectedSeatList.add(widget.seat);
        }
      },
      child: Stack(alignment: Alignment.center, children: [
        Icon(
          color: isSelect
              ? Colors.green
              : widget.isAvaialble
                  ? Colors.grey.shade500
                  : Colors.red,
          Icons.chair,
          size: 18,
        ),
        Text(
          widget.seat,
          style: TextStyle(
            fontSize: 5,
            color: isSelect
                ? Colors.white
                : widget.isAvaialble
                    ? Colors.black
                    : Colors.white,
          ),
        ),
      ]),
    );
  }
}
