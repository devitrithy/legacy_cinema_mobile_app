// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
    Orientation screen = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Background(
        child: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlurryContainer(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Iconsax.arrow_circle_left,
                                  ),
                                ),
                                Text(controller
                                    .showingTimeTicket.value.movie!.title
                                    .toString()
                                    .toUpperCase()),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                                controller.showingTime.value
                                                    .showingDate!,
                                                format: "d M Y"),
                                            icon: Icons.date_range_outlined),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextIcon(
                                            text: DateTimeFormat.format(
                                                controller.showingTime.value
                                                    .showingDate!,
                                                format: "h:i A"),
                                            icon: Icons.timer),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextIcon(
                                        text: controller.showingTimeTicket.value
                                            .hall!.location!.locationName
                                            .toString(),
                                        icon: Icons.location_on_outlined),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextIcon(
                                        text: controller.showingTimeTicket.value
                                            .hall!.hallName
                                            .toString(),
                                        icon: Icons.theaters_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: screen == Orientation.landscape ? 500 : 370,
                            child: RefreshIndicator(
                                onRefresh: () async => controller
                                    .fetchSeat(controller.showingId.toString()),
                                child: SeatWidget(controller: controller))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "select_seat".tr.toUpperCase(),
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                    return const Text(
                                      "-----",
                                      style: TextStyle(color: Colors.red),
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Divider(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                        "${'total'.tr.toUpperCase()}: \$${5 * controller.selectedSeatList.length}"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (controller
                                          .selectedSeatList.isNotEmpty) {
                                        // controller.purchaseTicket();
                                        controller.makePayment(
                                            amount: (controller.selectedSeatList
                                                        .length *
                                                    5)
                                                .toString(),
                                            currency: "USD");
                                      }
                                      return;
                                    },
                                    style: button.buttonPrimary,
                                    child: Text("pay".tr),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
