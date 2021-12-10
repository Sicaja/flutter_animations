import 'package:flutter_animations/pages/animation_builder.dart';
import 'package:flutter_animations/pages/animation_transform.dart';
import 'package:flutter_animations/pages/animation_transform_3d.dart';
import 'package:flutter_animations/pages/home_page.dart';
import 'package:flutter_animations/pages/pageview_transform.dart';
import 'package:flutter_animations/routes/routes_values.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static List<GetPage> listRoutes = [
    GetPage(
      name: RoutesValues.home,
      page: () => const Home(),
    ),
    GetPage(
      name: RoutesValues.animationBuilder,
      page: () => const AnimationBuilderExample(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: RoutesValues.animationTransform,
      page: () => const AnimationTransform(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: RoutesValues.animationTransform3D,
      page: () => const AnimationTransform3D(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: RoutesValues.pageviewtransform,
      page: () => const PageViewTransform(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
  ];
}
