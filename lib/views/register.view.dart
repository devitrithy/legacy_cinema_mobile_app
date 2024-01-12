import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/components/register_form.dart';
import 'package:legacy_cinema/controllers/register.controller.dart';
import 'package:legacy_cinema/utils/components/shared/form.comp.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final RegisterController controller = Get.put(RegisterController());

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
              child: RegisterFormMethod(),
            );
          }
        },
      ),
    );
  }
}
