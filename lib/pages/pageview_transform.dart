import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/pageview_transform_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PageViewTransform extends StatelessWidget {
  const PageViewTransform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageViewTransformController>(
      init: PageViewTransformController(),
      initState: (_) {},
      builder: (animation) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Page view"),
          ),
          body: Center(
            child: PageView.builder(
              controller: animation.pageController,
              
              itemBuilder: (con, index) {
                final percent = (animation.currentPage - index);
                final value = percent.clamp(0.0, 1.0);

                return Opacity(
                  opacity: 1 - value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 30.0,
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateY((pi) * (1 - value)),
                      child: Image.asset(
                        "assets/image${index + 1}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 6,
            ),
          ),
        );
      },
    );
  }
}
