import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/scrollanimation_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ScrollAnimation extends StatelessWidget {
  const ScrollAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ScrollAnimationController>(
        init: ScrollAnimationController(),
        initState: (_) {},
        builder: (animation) {
          return Center(
            child: Material(
              elevation: 5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: CustomScrollView(
                  controller: animation.scrollController,
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Placeholder(
                        fallbackHeight: 100.00,
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: CustomPersistentHeader(),
                      floating: true,
                      pinned: true,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final itemPositionOffset = index * 140;
                            final difference =
                                animation.scrollController.offset -
                                    itemPositionOffset;
                            final percent = 1 - (difference / 140);
                            final value = percent.clamp(0.0, 1.0);

                            return Align(
                              heightFactor: 0.7,
                              child: Opacity(
                                opacity: value,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..scale(
                                      value.clamp(0.5, 1),
                                    ),
                                  child: SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      elevation: 5,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Image.asset(
                                          "assets/image${index + 1}.jpg",
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const Text("Que ondas");
  }

  @override
  double get maxExtent => 100.00;

  @override
  double get minExtent => 90.00;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
