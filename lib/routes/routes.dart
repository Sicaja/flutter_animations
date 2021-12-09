import 'package:flutter/animation.dart';
import 'package:flutter_animations/pages/animation_builder.dart';
import 'package:flutter_animations/pages/home_page.dart';
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
  ];
}
