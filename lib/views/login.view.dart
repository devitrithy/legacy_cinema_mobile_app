import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/components/login_form_method.dart';
import 'package:legacy_cinema/utils/components/shared/form.comp.dart';
import 'package:legacy_cinema/controllers/login.controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return FormComponent(
              formKey: controller.formKey,
              child: LoginFormMethod(),
            );
          }
        },
      ),
    );
  }
}
