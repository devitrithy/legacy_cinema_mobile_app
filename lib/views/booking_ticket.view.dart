// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/seat.comp.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/components/shared/text_icon.comp.dart';
import 'package:legacy_cinema/utils/components/shared/button_style.comp.dart'
    as button;
import 'package:legacy_cinema/utils/public_used.dart';

class SelectingSeatView extends StatelessWidget {
  SelectingSeatView({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(controller.movieList[controller.movieIndex.toInt()].title
            .toString()
            .toUpperCase()),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Background(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          LogoComponent(isDark: PublicUsed.isDark()),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextIcon(
                                      text: DateTimeFormat.format(
                                          controller
                                              .showingTime.value.showingDate!,
                                          format: "d M Y"),
                                      icon: Icons.date_range_outlined),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  TextIcon(
                                      text: DateTimeFormat.format(
                                          controller
                                              .showingTime.value.showingDate!,
                                          format: "h:i A"),
                                      icon: Icons.timer),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextIcon(
                                  text: controller.showingTimeTicket.value.hall!
                                      .location!.locationName
                                      .toString(),
                                  icon: Icons.location_on_outlined),
                              const SizedBox(
                                height: 10,
                              ),
                              TextIcon(
                                  text: controller
                                      .showingTimeTicket.value.hall!.hallName
                                      .toString(),
                                  icon: Icons.theaters_outlined),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: SeatWidget(controller: controller)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Seat",
                            style: TextStyle(
                                color: Colors.red.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            if (controller.selectedSeatList.isNotEmpty) {
                              return Text(
                                controller.selectedSeatList
                                    .toString()
                                    .substring(
                                        1,
                                        controller.selectedSeatList
                                                .toString()
                                                .length -
                                            1),
                              );
                            } else {
                              return const Text("");
                            }
                          })
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextIcon(icon: Icons.chair, text: "\$5"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                    "Total: \$${5 * controller.selectedSeatList.length}"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (controller.selectedSeatList.isNotEmpty) {
                                    controller.purchaseTicket();
                                  }
                                  return;
                                },
                                style: button.buttonPrimary,
                                child: const Text("Pay"),
                              ),
                            ],
                          )
                        ]),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
