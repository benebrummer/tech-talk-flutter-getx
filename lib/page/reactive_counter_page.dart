import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/reactive_counter_controller.dart';
import '../drawer/drawer.dart';

class ReactiveCounterPage extends StatelessWidget {
  const ReactiveCounterPage({super.key});

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
        title: const Text("Reactive Counter"),
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
          ],
        ),
      ),
    );
  }
}
