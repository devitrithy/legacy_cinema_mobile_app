import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/language_switch.dart';
import 'package:legacy_cinema/utils/components/shared/switch_mode.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 75.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${PublicUsed.apiEndPoint}/${PublicUsed.getUser()['profile']}"),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                PublicUsed.getUser()['username'],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                PublicUsed.getUser()['email'],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("language".tr),
                    LanguageSwitch(isKhmer: PublicUsed.changeLanguage()),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("mode".tr),
                    ModeSwitch(isDark: PublicUsed.changeTheme())
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("edit account".tr),
                    IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit))
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(BeveledRectangleBorder())),
              onPressed: () {
                PublicUsed.storage.remove(PublicUsed.token);
                Get.offNamed('/login');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.logout),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("logout".tr),
                ],
              ))
        ],
      ),
    ));
  }
}
