import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/animation_transform_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AnimationTransform extends StatelessWidget {
  const AnimationTransform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationTransformController>(
      init: AnimationTransformController(),
      initState: (_) {},
      builder: (animation) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Transform.scale(
                  scale: animation.iconAnimation?.value ?? 10,
                  child: const Icon(
                    Icons.play_arrow,
                  ),
                ),
              ),
              // Transform.translate(
              //   offset: Offset(0, animation.dy?.value ?? 5),
              //   child: Center(
              //     child: Container(
              //       color: Colors.amber,
              //       width: 300,
              //       height: 300,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
