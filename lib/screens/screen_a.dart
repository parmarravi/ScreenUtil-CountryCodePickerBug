import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/routing/app_routing.dart';

import 'splash_controller.dart';

class ScreenA extends GetView<SplashController> {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print("sad");
              },
              child: Text(
                'Screen A',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
