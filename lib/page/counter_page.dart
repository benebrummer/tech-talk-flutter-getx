import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_talk_flutter_get/controller/simple_counter_controller.dart';

import '../controller/reactive_counter_controller.dart';
import '../drawer/drawer.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReactiveCounterController reactiveController =
        Get.put(ReactiveCounterController());

    // example for workers
    ever(reactiveController.counter, (_) => print("Executed on value change"));
    once(reactiveController.counter,
        (_) => print("Executed on first value change"));

    debounce(reactiveController.counter,
        (_) => print("Executed after the value didn't change for 1s"),
        time: const Duration(seconds: 1));
    interval(
        reactiveController.counter,
        (_) =>
            print("Executed 1s after the change, ignoring changes in between"),
        time: const Duration(seconds: 1));

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
            Text(
              'Reactive Counter:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            // reactive approach
            Obx(
              () => Text(
                "${reactiveController.counter.value}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                reactiveController.increment();
              },
              heroTag: 'incrementR',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 40),

            // Simple approach
            Text(
              'Simple Counter:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            GetBuilder<SimpleCounterController>(
              // init the controller only the first time
              init: SimpleCounterController(),
              builder: (controller) => Text(
                "${controller.counter}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            const SizedBox(height: 20),
            GetBuilder<SimpleCounterController>(
              // no need to initialize the controller again
              builder: (controller) => FloatingActionButton(
                // heroTag: 'incrementS',
                onPressed: () => controller.increment(),
                heroTag: "incrementS",
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
