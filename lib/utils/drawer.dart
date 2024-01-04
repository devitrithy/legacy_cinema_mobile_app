import 'package:flutter/material.dart';
import 'package:legacy_cinema/utils/components/shared/switch_mode.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            onTap: () {
              //
            },
          ),
          ListTile(
            leading: ModeSwitch(isDark: PublicUsed.changeTheme()),
          )
        ],
      ),
    );
  }
}
