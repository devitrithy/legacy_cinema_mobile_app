import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/utils/components/shared/input.comp.dart';
import 'package:legacy_cinema/pages/login/controller/login.controller.dart';
import 'package:legacy_cinema/utils/public_used.dart';

// ignore: must_be_immutable
class LoginFormMethod extends StatelessWidget {
  var isKhmer = PublicUsed.storage.read("lang") != "kh" ? "kh" : "en";
  var isDark = PublicUsed.storage.read("darkMode") != "dark" ? "dark" : "light";
  LoginFormMethod({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
            onPressed: () {
              PublicUsed.storage.write("darkMode", isDark);
              Get.changeThemeMode(
                  isDark != "dark" ? ThemeMode.dark : ThemeMode.light);
            },
            child: Icon(isDark == "dark" ? Icons.light_mode : Icons.dark_mode),
          ),
          Image.asset(
            isDark != "dark"
                ? "assets/image/background_logo.jpg"
                : "assets/image/logo.png",
            width: 100,
          ),
          TextButton(
            onPressed: () {
              PublicUsed.storage.write("lang", isKhmer);
              Get.updateLocale(Locale(isKhmer, isKhmer));
            },
            child: Text(
              PublicUsed.storage.read("lang") != "kh" ? "🇰🇭" : "🇺🇸",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ]),
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
              style: TextStyle(
                fontFamily: isKhmer == "kh" ? "NotoSansKhmer" : "OpenSans",
              ),
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
              ),
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
