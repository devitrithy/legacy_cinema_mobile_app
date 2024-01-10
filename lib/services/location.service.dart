import 'dart:convert';

import 'package:legacy_cinema/models/cinema.model.dart';
import 'package:legacy_cinema/utils/public_used.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<dynamic> fetchLocations() async {
    const String url = "${PublicUsed.apiEndPoint}/location";
    var res = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<CinemaModel>.from(json
          .decode(res.body)['locations']
          .map((p) => CinemaModel.fromJson(p)));
    }
    return res.statusCode;
  }
}
