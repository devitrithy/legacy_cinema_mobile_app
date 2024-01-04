import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/models/login_user.model.dart';
import 'package:legacy_cinema/services/login.service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginMessage = "".obs;
  var availableAccount = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validateUsername(String txt) {
    if (txt.toString().trim().isEmpty) {
      return "username_cant_be_empty".tr;
    } else if (txt.length < 3) {
      return "username_must_be_at_least_3_characters";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value.isEmpty) {
      return 'password_is_required'.tr;
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least \n1 Uppercase\n1 Lowercase\n1 Digit\n1 Special character\nAt least 8 characters long';
    }
    return null;
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
