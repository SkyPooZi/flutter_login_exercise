import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/splash_screen.dart';
import 'package:get/get.dart';

import 'login_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
