import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewTransformController extends GetxController {
  PageController pageController = PageController();

  double currentPage = 0.0;

  @override
  void onInit() {
    pageController.addListener(_listener);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.onClose();
  }

  void _listener() {
    currentPage = pageController.page ?? 0.0;
    update();
  }
}
