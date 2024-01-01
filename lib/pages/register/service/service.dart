import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:legacy_cinema/pages/register/model/user.mode.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HttpService {
//
  static String url = "${PublicUsed.apiEndPoint}/user/register";
  static registerAccount(UserInfoModel user, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields["firstname"] = user.firstname.toString();
    request.fields["lastname"] = user.lastname.toString();
    request.fields["email"] = user.email.toString();
    request.fields["username"] = user.username.toString();
    request.fields["password"] = user.password.toString();

    var file = http.MultipartFile.fromBytes(
        "", (await rootBundle.load(file.field)).buffer.asUint8List());
  }
}
