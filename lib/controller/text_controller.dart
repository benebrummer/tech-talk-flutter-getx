import 'package:english_words/english_words.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  Rx<WordPair> randomText = WordPair.random().obs;

  void nextText() {
    randomText.value = WordPair.random();
  }
}
