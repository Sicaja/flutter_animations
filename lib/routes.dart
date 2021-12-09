import 'package:flutter_animations/pages/home_page.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static List<GetPage> listRoutes = [
    GetPage(
      name: "/home",
      page: () => const Home(),
    ),
  ];
}
