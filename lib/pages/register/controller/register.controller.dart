import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/pages/login/model/user.model.dart';
import 'package:legacy_cinema/pages/login/service/login.service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var loginMessage = "".obs;
  var availableAccount = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validateUsername(String txt) {
    if (txt.length < 3) return "Username must be at least 3 characters";
    return null;
  }

  String? validatePassword(String value) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least \n1 Uppercase\n1 Lowercase\n1 Digit\n1 Special character\nAt least 8 characters long';
    }
    return null;
  }

  String? validateEmail(String value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    // Regular expression pattern for basic email validation

    if (value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Return null to indicate the email is valid
  }

  String? validateConfirmPassword(String value) {
    var validate = validatePassword(value);
    if (validate == null) {
      if (value != passwordController.text) {
        return "Password does not match";
      }
      return null;
    } else {
      return validate;
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
