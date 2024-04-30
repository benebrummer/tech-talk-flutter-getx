import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/counter_page.dart';

Widget getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary),
          child: const Text('GetX Demo'),
        ),
        ListTile(
          title: const Text('Counter'),
          onTap: () {
            // Without named route
            Get.to(const CounterPage());
          },
        ),
        ListTile(
          title: const Text('Text Generator'),
          onTap: () {
            // With named route
            Get.toNamed('/text');
          },
        ),
      ],
    ),
  );
}
