import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_talk_flutter_get/page/reactive_counter_page.dart';

class GetDemoApp extends StatelessWidget {
  const GetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // instead of MaterialApp
      title: 'Flutter GetX Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReactiveCounterPage(),
    );
  }
}
