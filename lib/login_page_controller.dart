import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_login_exercise/home_page_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  late final SharedPreferences prefs;
  TextEditingController? cEmail;
  TextEditingController? cPass;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cEmail = new TextEditingController();
    cPass = new TextEditingController();
  }

  loginUser() async {
    prefs = await SharedPreferences.getInstance();
    final baseUrl = "https://reqres.in/api/login";
    isLoading.value = true;
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        "email" :  cEmail!.text,
        "password" :  cPass!.text,
      },
    );
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getToken = jsonDecode(response.body);
        final token = getToken["token"];
        print("Token : $token");
        await prefs.setString('token', token);
        Get.snackbar("Selamat", "Login Sukses");
        Get.off(HomePage());
        isLoading.value = false;
      } else {
        Get.snackbar("Maaf", "Gagal Login");
      }
    } catch (e) {
      print(e);
    }
  }
}