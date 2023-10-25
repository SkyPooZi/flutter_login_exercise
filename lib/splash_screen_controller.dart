import 'package:flutter_login_exercise/home_page_view.dart';
import 'package:flutter_login_exercise/login_page_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  late final SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 3), () async {
      if (prefs.getString('token') == null) {
        Get.off(LoginPageView());
      } else {
        Get.off(HomePage());
      }
    });
  }
}