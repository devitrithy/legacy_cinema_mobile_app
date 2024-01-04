// import 'package:http/http.dart' as http;
// import 'package:legacy_cinema/models/movie.model.dart';
// import 'package:legacy_cinema/utils/public_used.dart';

// class HttpService {
//   static const String _url = "${PublicUsed.apiEndPoint}/user/login";
//   static Future<MovieModel> fetchAllMovies() async {
//     try {
//       var res = await http.post(
//         Uri.parse(_url),
//         headers: {
//           'Authorization': "Bearer ${PublicUsed.storage.read(PublicUsed.token)}"
//         },
//       );
//       if (res.statusCode == 200) {}
//     } catch (e) {
//       return 500;
//     }
//   }
// }
