import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/history_ticket.contoller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});
  final HistoryTicketController controller = Get.put(HistoryTicketController());

  @override
  Widget build(BuildContext context) {
    print(controller.bookingTickets.length);
    return Background(
      child: RefreshIndicator(
        onRefresh: () => controller.fetchTicket(),
        child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
                title: Text(
                    controller.bookingTickets[index].isRecived.toString())),
            itemCount: controller.bookingTickets.length),
      ),
    );
  }
}
