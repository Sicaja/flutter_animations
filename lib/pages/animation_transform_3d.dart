import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/animation_transform_third.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AnimationTransform3D extends StatelessWidget {
  const AnimationTransform3D({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationTransformThirdController>(
      init: AnimationTransformThirdController(),
      initState: (_) {},
      builder: (animation) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateY(pi * animation.value),
                  child: Image.asset(
                    "assets/f-image.png",
                    width: 300,
                  ),
                ),
                Slider(
                  value: animation.value,
                  onChanged: animation.changeValue,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Valor: ${animation.value.toStringAsFixed(2)}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
