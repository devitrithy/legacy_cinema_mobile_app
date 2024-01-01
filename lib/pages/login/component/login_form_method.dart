import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/components/shared/input.comp.dart';
import 'package:legacy_cinema/pages/login/controller/login.controller.dart';

class LoginFormMethod extends StatelessWidget {
  LoginFormMethod({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/image/logo.png",
            width: 100,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        InputForm(
          label: "username".tr,
          validator: (txt) => controller.validateUsername(txt!),
          icon: const Icon(Icons.person),
          controller: controller.usernameController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "password".tr,
          validator: (txt) => controller.validateUsername(txt!),
          icon: const Icon(Icons.key),
          obscureText: true,
          controller: controller.passwordController,
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(() {
          if (controller.availableAccount.isFalse) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.loginMessage.toString(),
                  style: TextStyle(
                    color: Colors.red.shade900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }
          return const SizedBox();
        }),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(10),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red.shade800),
            ),
            onPressed: loginMethod,
            icon: const Icon(Icons.login),
            label: Text(
              "login".tr,
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("dont_have_account".tr),
              TextButton(
                onPressed: () {
                  Get.offNamed('/register');
                },
                child: Text(
                  "sign_up".tr,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void loginMethod() async {
    if (controller.formKey.currentState!.validate()) {
      if (await controller.isLogin()) {
        controller.usernameController.text = "";
        controller.passwordController.text = "";
        Get.offNamed("/home");
      } else {
        return;
      }
    }
    controller.availableAccount(true);
    return;
  }
}
