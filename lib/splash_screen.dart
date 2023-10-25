import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  SplashScreenController splashscreencontroller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text("Ini Splash Screen"),),
      ),
    );
  }
}
