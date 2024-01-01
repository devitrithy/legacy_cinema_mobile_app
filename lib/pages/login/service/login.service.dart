import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legacy_cinema/pages/login/model/token.model.dart';
import 'package:legacy_cinema/pages/login/model/user.model.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HttpService {
  static const String _url = "${PublicUsed.apiEndPoint}/user/login";
  static Future<int> userLogin(UserModel user) async {
    try {
      var res = await http.post(
        Uri.parse(_url),
        body: json.encode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (res.statusCode == 200) {
        PublicUsed.storage.write(
            PublicUsed.token, TokenModel.fromJson(json.decode(res.body)));
        return res.statusCode;
      }
      return res.statusCode;
    } catch (e) {
      return 500;
    }
  }
}
