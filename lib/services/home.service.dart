import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:legacy_cinema/models/location.model.dart';
import 'package:legacy_cinema/models/movie.model.dart';
import 'package:legacy_cinema/models/seat.model.dart';
import 'package:legacy_cinema/models/session.model.dart';
import 'package:legacy_cinema/models/showing_time_for_ticket.model.dart';
import 'package:legacy_cinema/models/slideshow.model.dart';
import 'package:legacy_cinema/models/ticket.model.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HttpService {
  static const String _urlSlideshow = "${PublicUsed.apiEndPoint}/slideshow";
  // ignore: unused_field
  static final _token = PublicUsed.getToken();
  static Future<dynamic> fetchSlideshows() async {
    var res = await http.get(Uri.parse(_urlSlideshow),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<SlideshowModel>.from(json
          .decode(res.body)['slideshows']
          .map((p) => SlideshowModel.fromJson(p)));
    }
    return res.statusCode;
  }

  static Future<dynamic> fetchMovies() async {
    const String url = "${PublicUsed.apiEndPoint}/movie";
    var res = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<MovieModel>.from(
          json.decode(res.body)['movies'].map((p) => MovieModel.fromJson(p)));
    }
    return res.statusCode;
  }

  static Future<dynamic> fetchShowingTimeTicket(String id) async {
    try {
      String url = "${PublicUsed.apiEndPoint}/showing/$id";
      var res = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
      if (res.statusCode == 200) {
        return List<ShowingTimeTicketModel>.from(json
            .decode(res.body)['showingtime']
            .map((p) => ShowingTimeTicketModel.fromJson(p)));
      }
      return res.statusCode;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  static Future<dynamic> fetchSeat(String id) async {
    String url = "${PublicUsed.apiEndPoint}/ticket/$id";
    var res = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<SeatModel>.from(
          json.decode(res.body).map((p) => SeatModel.fromJson(p)));
    }
    return res.statusCode;
  }

  static Future<dynamic> fetchShowingTime(String movieId, int day) async {
    String url = "${PublicUsed.apiEndPoint}/showing/now/$movieId?day=$day";
    var res = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${PublicUsed.getToken()}'});
    if (res.statusCode == 200) {
      return List<LocationModel>.from(
          json.decode(res.body).map((p) => LocationModel.fromJson(p)));
    } else {
      return res.statusCode;
    }
  }

  static Future<dynamic> purchaseTicket(List<TicketModel> items) async {
    String url = "${PublicUsed.apiEndPoint}/stripe/checkout";
    var res = await http
        .post(Uri.parse(url), body: json.encode({"items": items}), headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${PublicUsed.getToken()}"
    });
    if (res.statusCode == 200) {
      return SessionModel.fromJson(json.decode(res.body));
    } else {
      print(res.statusCode);
      throw Exception();
    }
  }
}
