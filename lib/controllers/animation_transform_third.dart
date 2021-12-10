import 'package:get/get.dart';

class AnimationTransformThirdController extends GetxController {
  double value = 0;

  void changeValue(double data) {
    value = data;
    update();
  }
}
