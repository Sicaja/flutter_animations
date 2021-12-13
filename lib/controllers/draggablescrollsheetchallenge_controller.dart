import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableScrollSheetChallengeController extends GetxController {
  double percent = 0.0;
  double percentOpacity = 0.0;
  GlobalKey searchHeaderKey = GlobalKey();
  double topBarNotifications = 0.0;

  @override
  void onInit() {
    topBarNotifications = Get.statusBarHeight;
    super.onInit();
  }

  double? getHeightWidget() {
    return (searchHeaderKey.currentContext?.size?.height ?? 0.0);
  }

  void calcHideHeader(double extent) {
    percent = 2 * extent - 0.8;
    percentOpacity = 2 * extent - 0.8;
    percent = (-(getHeightWidget() ?? 0.0)) * (1 - percent);
    update();
  }
}
