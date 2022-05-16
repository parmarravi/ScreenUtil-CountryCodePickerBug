import 'dart:async';

import 'package:get/get.dart';

import 'routing/app_routing.dart';

class SplashController extends GetxController {
  final String TAG = "SplashController";
  RxString appVersion = "".obs;
  Rx<bool> isLoading = false.obs;
  bool isRetryDialog = false;
  SplashController();

  @override
  void onInit() {
    super.onInit();
    Get.log("onInit");
    startTime();
  }

  Future<Timer> startTime() async {
    return Timer(const Duration(seconds: 3), navigationPage);
  }

  Future<void> navigationPage() async {
    Get.log("navigationPage");
    Get.offNamed(RoutingApp.ScreenBRoute);
  }
}
