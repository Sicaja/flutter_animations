import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimationBuilderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? counter;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    counter = Tween<double>(begin: 0, end: 1).animate(animationController!);
    super.onInit();
  }
}
