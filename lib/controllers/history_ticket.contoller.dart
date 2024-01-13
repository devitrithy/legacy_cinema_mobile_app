import 'package:get/get.dart';
import 'package:legacy_cinema/models/history_ticket.model.dart';
import 'package:legacy_cinema/services/history.service.dart';

class HistoryTicketController extends GetxController {
  var bookingTickets = RxList<HistoryTicketModel>();
  var historyTicket = RxList<HistoryTicketModel>();
  var currentTicketIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTicket();
  }

  fetchTicket() async {
    try {
      historyTicket.value = [];
      bookingTickets.value = [];
      List<HistoryTicketModel> res = await HttpService.fetchBookingHistory();
      if (res == 401) {
        Get.offNamed('/login');
      } else {
        for (var i = 0; i < res.length; i++) {
          print(DateTime.now().isBefore(res[i].showingtime!.showingDate!));
          if (DateTime.now().isBefore(res[i].showingtime!.showingDate!)) {
            bookingTickets.add(res[i]);
          } else {
            historyTicket.add(res[i]);
          }
        }

        print("Booking Ticket ${bookingTickets.length}");
        print("History Ticket ${historyTicket.length}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
