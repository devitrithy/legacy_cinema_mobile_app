import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/pages/login/model/user.model.dart';
import 'package:legacy_cinema/pages/login/service/login.service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginMessage = "".obs;
  var availableAccount = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validateUsername(String txt) {
    if (txt.toString().trim().isEmpty) {
      return "Username can't be empty";
    } else if (txt.length < 3) {
      return "Username must be at least 3 characters";
    } else {
      return null;
    }
  }

  Future<bool> isLogin() async {
    isLoading(true);
    try {
      int login = await HttpService.userLogin(UserModel(
          username: usernameController.text,
          password: passwordController.text));
      if (login == 200) {
        availableAccount(true);
        return true;
      } else if (login == 404) {
        loginMessage("⚠ Invalid username or password️");
        availableAccount(false);
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      isLoading(false);
    }
  }
}
