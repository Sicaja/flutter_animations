import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScrollAnimationController extends GetxController {
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController.addListener(_listener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.onClose();
  }

  void _listener() {
    update();
  }
}
