import 'package:get/get.dart';

class SimpleCounterController extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    if (counter % 2 == 0) {
      update();
    }
  }
}
