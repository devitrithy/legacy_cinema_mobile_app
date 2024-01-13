// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:legacy_cinema/controllers/history_ticket.contoller.dart';
import 'package:legacy_cinema/models/history_ticket.model.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});
  final HistoryTicketController controller = Get.put(HistoryTicketController());

  @override
  Widget build(BuildContext context) {
    return Background(
      child: RefreshIndicator(
        onRefresh: () => controller.fetchTicket(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 90),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    () => TextButton(
                      onPressed: () => controller.currentTicketIndex.value = 0,
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              controller.currentTicketIndex.value == 0
                                  ? Colors.red
                                  : Theme.of(context).colorScheme.primary)),
                      child: Text("order_ticket".tr),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                  Obx(
                    () => TextButton(
                      onPressed: () => controller.currentTicketIndex.value = 1,
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              controller.currentTicketIndex.value == 1
                                  ? Colors.red
                                  : Theme.of(context).colorScheme.primary)),
                      child: Text("history_ticket".tr),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() {
                  if (controller.currentTicketIndex.value == 0) {
                    return ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                              onTap: () => _dialogBuilder(
                                context,
                                controller.bookingTickets[index].showingtime!
                                    .hall!.location!.locationName
                                    .toString(),
                                controller.bookingTickets[index].showingtime!
                                    .hall!.hallName
                                    .toString(),
                                controller.bookingTickets[index].ticketDetails!
                                    .toList(),
                              ),
                              subtitle: Text(
                                DateTimeFormat.format(
                                    controller.bookingTickets[index]
                                        .showingtime!.showingDate!,
                                    format: "d M Y - h:m A"),
                              ),
                              trailing: const Icon(Iconsax.eye4),
                              title: Text(controller.bookingTickets[index]
                                  .showingtime!.movie!.title!
                                  .toString()),
                            ),
                        itemCount: controller.bookingTickets.length);
                  } else {
                    return ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                              onTap: () => _dialogBuilder(
                                context,
                                controller.historyTicket[index].showingtime!
                                    .hall!.location!.locationName
                                    .toString(),
                                controller.historyTicket[index].showingtime!
                                    .hall!.hallName
                                    .toString(),
                                controller.historyTicket[index].ticketDetails!
                                    .toList(),
                              ),
                              subtitle: Text(
                                DateTimeFormat.format(
                                    controller.historyTicket[index].showingtime!
                                        .showingDate!,
                                    format: "d M Y - h:m A"),
                              ),
                              trailing: const Icon(Iconsax.eye4),
                              title: Text(controller.historyTicket[index]
                                  .showingtime!.movie!.title!
                                  .toString()),
                            ),
                        itemCount: controller.historyTicket.length);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String cinema, String hall,
      List<TicketDetails> seat) {
    var seats = [];
    for (var item in seat) {
      seats.add(item.seat);
    }
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cinema),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(hall),
            ],
          ),
          icon: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.chair),
              const SizedBox(
                width: 5,
              ),
              Text("Buy Ticket x${seat.length}"),
            ],
          ),
          content: Text(
            seats.toString().substring(1, seats.toString().length - 1),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TabComponent extends StatelessWidget {
  const TabComponent({
    Key? key,
    required this.onPressed,
    required this.isActive,
    required this.label,
  }) : super(key: key);
  final Function() onPressed;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(
              isActive ? Colors.red : Theme.of(context).colorScheme.primary)),
      child: Text(label.tr),
    );
  }
}
