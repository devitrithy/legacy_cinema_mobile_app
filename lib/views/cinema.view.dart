import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:legacy_cinema/controllers/location.controller.dart';
import 'package:legacy_cinema/utils/components/shared/background.comp.dart';
import 'package:legacy_cinema/utils/components/shared/logo.comp.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class CinemaView extends StatelessWidget {
  CinemaView({super.key});
  final CinemaController controller = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    return Background(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.fetchLocation();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 80),
          child: Obx(
            () {
              if (controller.isLoading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      onTap: () => print(
                        controller.locationList[index].locationId,
                      ),
                      leading: LogoComponent(
                        isDark: PublicUsed.isDark(),
                      ),
                      title: Text(
                        controller.locationList[index].locationName,
                      ),
                      trailing: const Icon(Iconsax.info_circle),
                    ),
                  ),
                  itemCount: controller.locationList.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
