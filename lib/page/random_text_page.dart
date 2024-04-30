import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/text_controller.dart';
import '../drawer/drawer.dart';

class RandomTextPage extends StatelessWidget {
  RandomTextPage({super.key});
  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Random Text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // reactive approach
            GetX<TextController>(
              builder: (controller) => Text(
                "${controller.randomText}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                textController.nextText();
              },
              tooltip: 'Generate',
              child: const Icon(Icons.casino),
            ),
          ],
        ),
      ),
      drawer: getDrawer(context),
    );
  }
}
