import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/animation_builder_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AnimationBuilderExample extends StatelessWidget {
  const AnimationBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationBuilderController>(
      init: AnimationBuilderController(),
      initState: (_) {},
      builder: (animation) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  animation.counter?.value.toStringAsFixed(4) ?? "0",
                  style: Get.textTheme.headline1,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    MaterialButton(
                      disabledColor: Colors.grey,
                      onPressed: (animation.isAnimationComplete)
                          ? null
                          : () {
                              animation.animationController?.reset();
                              animation.isAnimationComplete = true;
                            },
                      color: Colors.red,
                      child: Text(
                        "STOP",
                        style: Get.textTheme.headline3?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      disabledColor: Colors.grey,
                      onPressed: (animation.isAnimationComplete)
                          ? null
                          : () {
                              animation.animationController?.stop();
                            },
                      color: Colors.grey.shade700,
                      child: Text(
                        "PAUSE",
                        style: Get.textTheme.headline3?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (animation.animationController?.isCompleted ??
                            true) {
                          animation.animationController?.forward(from: 0.0);
                        } else {
                          animation.animationController?.forward();
                        }
                        animation.isAnimationComplete = false;
                      },
                      color: animation.color?.value ?? Colors.grey.shade700,
                      child: Text(
                        "START",
                        style: Get.textTheme.headline3?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
