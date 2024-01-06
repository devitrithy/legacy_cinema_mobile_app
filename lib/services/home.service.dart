import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:legacy_cinema/models/movie.model.dart';
import 'package:legacy_cinema/models/showingTime.model.dart';
import 'package:legacy_cinema/models/slideshow.model.dart';
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

  static Future<dynamic> fetchShowingTime(String movieId) async {
    int day = DateTime.now().day;
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
}
