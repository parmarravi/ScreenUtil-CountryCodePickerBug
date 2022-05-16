import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/binding.dart';
import 'package:untitled/screens/screen_a.dart';
import 'package:untitled/screens/screen_b.dart';
import 'package:untitled/screens/screen_c.dart';

class RoutingApp {
  static String TAG = "APP ROUTING";

  static String ScreenARoute = "/";
  static String ScreenBRoute = "/ScreenB";
  static String ScreenCRoute = "/ScreenC";

  static List<GetPage> getRoutingPages() {
    return [
      GetPage(
          name: ScreenARoute,
          page: () => const ScreenA(),
          binding: SplashBinding()),
      GetPage(
        name: ScreenBRoute,
        page: () => ScreenB(),
      ),
      GetPage(
        name: ScreenCRoute,
        page: () => ScreenC(),
      ),
    ];
  }

  static routingCallback(Routing? routing) {
    // Get.find<BaseController>().updateRoutes(routing);
    if (routing != null) {
      String currentRoute = routing.current;
      if (currentRoute == RoutingApp.ScreenARoute) {
        hideAll();
      } else if (currentRoute == RoutingApp.ScreenBRoute) {
        showBottomAndStatusBar();
      } else {
        noStatusBar();
      }
    }
  }

  static void colorChangeBottomSheetDialogStatusBar() {
    Future.delayed(const Duration(milliseconds: 150), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: true,
            statusBarColor: Colors.grey.withOpacity(0.01),
            systemNavigationBarColor: Colors.yellow),
      );
    });
  }

  static void colorChangeDialogStatusBar() {
    Future.delayed(const Duration(milliseconds: 150), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: true,
            statusBarColor: Colors.grey.withOpacity(0.01),
            systemNavigationBarColor: Colors.transparent.withOpacity(0.8)),
      );
    });
  }

  static Future<void> colorChangeStatusBar(bool lightMode, Color color) {
    return Future.delayed(const Duration(milliseconds: 150), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: color,
          statusBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
          systemNavigationBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
        ),
      );
    });
  }

  static Future<void> showBottomAndStatusBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  static Future<void> noStatusBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  static Future<void> hideAll() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
  }

  static Future<void> colorChangeBottomNavBar(bool lightMode, Color navColor) {
    return Future.delayed(const Duration(milliseconds: 150), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: navColor,
          statusBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
          systemNavigationBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
        ),
      );
    });
  }

  static void colorChangeStatusBottomNavBar(
      bool lightMode, Color color, Color navColor) {
    Future.delayed(const Duration(milliseconds: 150), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: color,
          systemNavigationBarColor: navColor,
          statusBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
          systemNavigationBarIconBrightness:
              lightMode ? Brightness.dark : Brightness.light,
        ),
      );
    });
  }
}
