import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/controllers/register.controller.dart';
import 'package:legacy_cinema/utils/components/shared/circle_avatar.comp.dart';
import 'package:legacy_cinema/utils/components/shared/input.comp.dart';

class RegisterFormMethod extends StatelessWidget {
  RegisterFormMethod({super.key});
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Obx(() {
            if (controller.selectedImage.value != null) {
              return CircleAvatarPicker(
                onTapUp: (p0) => controller.pickImage(),
                image: FileImage(controller.selectedImage.value!),
              );
            } else {
              return CircleAvatarPicker(
                onTapUp: (p0) => controller.pickImage(),
                image: const AssetImage("assets/image/pro.png"),
              );
            }
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "firstname".tr,
          validator: (txt) => controller.validateString("Firstname", txt!),
          icon: const Icon(Icons.accessibility),
          controller: controller.firstnameController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "lastname".tr,
          validator: (txt) => controller.validateString("Lastname", txt!),
          icon: const Icon(Icons.accessibility_new),
          controller: controller.lastnameController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "email".tr,
          validator: (txt) => controller.validateEmail(txt!),
          icon: const Icon(Icons.email),
          controller: controller.emailController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "username".tr,
          validator: (txt) => controller.validateString("Username", txt!),
          icon: const Icon(Icons.person),
          controller: controller.usernameController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "password".tr,
          validator: (txt) => controller.validatePassword(txt!),
          icon: const Icon(Icons.key),
          obscureText: true,
          controller: controller.passwordController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          label: "confirm_password".tr,
          validator: (txt) => controller.validateConfirmPassword(txt!),
          icon: const Icon(Icons.key_off),
          obscureText: true,
          controller: controller.confirmPasswordController,
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
            onPressed: registerMethod,
            icon: const Icon(Icons.account_box),
            label: Text(
              "sign_up".tr,
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("already_have_account".tr),
              TextButton(
                onPressed: () {
                  Get.offNamed('/login');
                },
                child: Text(
                  "sign_in".tr,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void registerMethod() async {
    if (controller.formKey.currentState!.validate()) {
      if (await controller.isRegister()) {
        controller.lastnameController.text = "";
        controller.firstnameController.text = "";
        controller.emailController.text = "";
        controller.usernameController.text = "";
        controller.confirmPasswordController.text = "";
        controller.passwordController.text = "";
        controller.selectedImage.value = null;
        Get.offNamed("/login");
      } else {
        return;
      }
    }
    return;
  }
}
