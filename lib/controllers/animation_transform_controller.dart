import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimationTransformController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? dy;
  Animation<double>? iconAnimation;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    iconAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: 8,
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 8,
          end: 20,
        ),
        weight: 50,
      ),
    ]).animate(
      animationController!,
    );
    dy = Tween<double>(
      begin: -300.00,
      end: 300.00,
    ).animate(
      animationController!,
    );
    dy?.addListener(() {
      update();
    });
    animationController?.forward();
    super.onInit();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}
