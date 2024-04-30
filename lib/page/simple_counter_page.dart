import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_talk_flutter_get/controller/simple_counter_controller.dart';

import '../drawer/drawer.dart';

class SimpleCounterPage extends StatelessWidget {
  const SimpleCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter"),
      ),
      drawer: getDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Simple approach
            Text(
              'Simple Counter:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            GetBuilder<SimpleCounterController>(
              // init the controller only the first time
              init: SimpleCounterController(),
              builder: (controller) => Column(
                children: [
                  Text(
                    "${controller.counter}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton(
                    // heroTag: 'incrementS',
                    onPressed: () => controller.increment(),
                    heroTag: "incrementS",
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
