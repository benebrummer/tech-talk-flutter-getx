import 'package:flutter/material.dart';

// Counter Page variant without using state management with GetX
// Not used in the app
class ClassicCounterPage extends StatefulWidget {
  const ClassicCounterPage({super.key});

  @override
  State<ClassicCounterPage> createState() => _ClassicCounterPageState();
}

class _ClassicCounterPageState extends State<ClassicCounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Classic Stateful Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count:",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: "Increment",
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
