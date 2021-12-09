import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationBuilderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? counter;
  Animation<Color?>? color;

  bool isAnimationComplete = true;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    counter = Tween<double>(begin: 0, end: 1).animate(animationController!);
    color = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.blue),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.orange),
        weight: 50,
      ),
    ]).animate(animationController!);

    // color = ColorTween(begin: Colors.orange, end: Colors.blue)
    //     .animate(animationController!);

    counter?.addListener(() {
      update();
      if (animationController?.isCompleted ?? false) {
        print("Completado");
        isAnimationComplete = true;
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}
