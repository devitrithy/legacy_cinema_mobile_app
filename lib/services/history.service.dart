import 'dart:convert';

import 'package:legacy_cinema/models/history_ticket.model.dart';
import 'package:legacy_cinema/utils/public_used.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<dynamic> fetchBookingHistory() async {
    String url = "${PublicUsed.apiEndPoint}/booking/${PublicUsed.getUserId()}";
    var res = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<HistoryTicketModel>.from(json
          .decode(res.body)['locations']
          .map((p) => HistoryTicketModel.fromJson(p)));
    }
    return res.statusCode;
  }
}
