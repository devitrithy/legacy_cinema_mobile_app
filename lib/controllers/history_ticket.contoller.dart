import 'package:get/get.dart';
import 'package:legacy_cinema/services/history.service.dart';

class HistoryTicketController extends GetxController {
  RxList bookingTickets = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTicket();
  }

  fetchTicket() async {
    try {
      var res = await HttpService.fetchBookingHistory();
      print(res);
      if (res == 401) {
        Get.offNamed('/login');
      } else {
        bookingTickets.value = res;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
