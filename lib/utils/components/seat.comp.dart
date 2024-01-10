import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlurryContainer(
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            padding: const EdgeInsets.all(10),
            color: Colors.black54,
            height: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 200,
                  child: InteractiveViewer(
                    child: GridView.builder(
                      itemCount: controller.seatList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 20),
                      itemBuilder: (context, index) {
                        return SeatComponent(
                          isAvaialble: !controller.seatList[index].selected,
                          seat: controller.seatList[index].seatNumber,
                          controller: controller,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Container(
                    width: 500,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          strokeAlign: 1,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    child: Center(
                      child: Text(
                        "screen".tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
