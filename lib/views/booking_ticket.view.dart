// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:legacy_cinema/controllers/home.controller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/components/shared/seat.comp.dart';
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
      body: Background(
          child: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const LogoComponent(),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            TextIcon(
                                text: DateTimeFormat.format(
                                    controller.showingTime.value.showingDate!,
                                    format: "d M Y"),
                                icon: Icons.date_range_outlined),
                            const SizedBox(
                              width: 20,
                            ),
                            TextIcon(
                                text: DateTimeFormat.format(
                                    controller.showingTime.value.showingDate!,
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
                    ))
                  ],
                ),
              ),
            ),
            Padding(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
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
                        child: GridView.builder(
                          itemCount: controller.seatList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 20),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SeatComponent(
                                isAvaialble:
                                    !controller.seatList[index].selected,
                                seat: controller.seatList[index].seatNumber,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextIcon(icon: Icons.chair, text: "\$5"),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                              PublicUsed.getUserId();
                            },
                            style: button.buttonPrimary,
                            child: Text("Pay"),
                          ),
                        ],
                      )
                    ]),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
