import 'package:get/get.dart';
import 'package:legacy_cinema/services/history.service.dart';

class HistoryTicket extends GetxController {
  var bookingTickets = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTicket();
  }

  fetchTicket() async {
    try {
      var res = HttpService.fetchBookingHistory();
      if (res == 401) {
        Get.offNamed('/login');
      } else {
        bookingTickets.value = res as List<HistoryTicket>;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
