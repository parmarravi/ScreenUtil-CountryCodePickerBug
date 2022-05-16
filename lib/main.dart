import 'dart:async';
import 'dart:io';

import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/app_config.dart';
import 'package:untitled/screens/routing/app_routing.dart';
import 'services/localization_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initSetup();
}

initSetup() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyAppGetXScreenUtils());
}

class MyAppGetXScreenUtils extends StatelessWidget {
  const MyAppGetXScreenUtils({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          splitScreenMode: false,
          minTextAdapt: true,
          designSize: const Size(393, 851),
          builder: (_) => GetMaterialApp(
              title: "Test",
              defaultTransition: Transition.fade,
              opaqueRoute: Get.isOpaqueRouteDefault,
              popGesture: Get.isPopGestureEnable,
              transitionDuration: Get.defaultDialogTransitionDuration,
              debugShowCheckedModeBanner: false,
              locale: LocalizationService.locale,
              translations: LocalizationService(),
              supportedLocales: languageSupported,
              localizationsDelegates: const [
                //CountryLocalizations.delegate, // Uncomment this to check for BUG
              ],
              themeMode: ThemeMode.light,
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              routingCallback: (routing) => RoutingApp.routingCallback(routing),
              initialRoute: RoutingApp.ScreenARoute,
              enableLog: true,
              getPages: RoutingApp.getRoutingPages()),
        ),
      ),
    );
  }
}

class MyAppGetX extends StatelessWidget {
  const MyAppGetX({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: GetMaterialApp(
          title: "Test",
          defaultTransition: Transition.fade,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          transitionDuration: Get.defaultDialogTransitionDuration,
          debugShowCheckedModeBanner: false,
          locale: LocalizationService.locale,
          translations: LocalizationService(),
          supportedLocales: languageSupported,
          localizationsDelegates: const [
            CountryLocalizations.delegate,
          ],
          themeMode: ThemeMode.light,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          routingCallback: (routing) => RoutingApp.routingCallback(routing),
          initialRoute: RoutingApp.ScreenARoute,
          enableLog: true,
          getPages: RoutingApp.getRoutingPages()),
    );
  }
}
