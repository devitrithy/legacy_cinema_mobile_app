// ignore_for_file: avoid_print

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:legacy_cinema/models/register_user.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HttpService {
//
  static String url = "${PublicUsed.apiEndPoint}/user";
  static Future<int> registerAccount(UserInfoModel user, File file) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields["firstname"] = user.firstname.toString();
      request.fields["lastname"] = user.lastname.toString();
      request.fields["email"] = user.email.toString();
      request.fields["username"] = user.username.toString();
      request.fields["password"] = user.password.toString();
      request.fields["confirmPassword"] = user.confirmPassword.toString();
      var picture = await http.MultipartFile.fromPath('profile', file.path);
      request.files.add(picture);
      var res = await request.send();
      print(res.statusCode);
      if (res.statusCode == 201) {
        return res.statusCode;
      }
      return res.statusCode;
    } catch (e) {
      print(e.toString());
      return 400;
    }
  }
}
