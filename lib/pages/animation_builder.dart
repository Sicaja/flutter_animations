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
                  "0",
                  style: Get.textTheme.headline1,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.grey.shade700,
                  child: Text(
                    "Start",
                    style: Get.textTheme.headline3?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
