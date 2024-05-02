import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_talk_flutter_get/page/random_text_page.dart';
import 'package:tech_talk_flutter_get/page/simple_counter_page.dart';

import '../page/reactive_counter_page.dart';

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
          title: const Text('Reactive Counter'),
          onTap: () {
            // Without named route
            Get.to(() => const ReactiveCounterPage());
          },
        ),
        ListTile(
          title: const Text('Text Generator'),
          onTap: () {
            // With named route
            Get.to(() => RandomTextPage());
          },
        ),
        ListTile(
          title: const Text('Simple Counter'),
          onTap: () {
            Get.to(() => const SimpleCounterPage());
          },
        )
      ],
    ),
  );
}
