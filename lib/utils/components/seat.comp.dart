import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/seat.comp.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      strokeAlign: 1,
                      color: Theme.of(context).colorScheme.error),
                ),
                child: const Center(child: Text("Screen")),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() {
              return Expanded(
                child: InteractiveViewer(
                  child: GridView.builder(
                    itemCount: controller.seatList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 20),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SeatComponent(
                          isAvaialble: !controller.seatList[index].selected,
                          seat: controller.seatList[index].seatNumber,
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
