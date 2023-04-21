import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Rx<ThemeData> themeData = ThemeData.light().obs;

  bool get isDark => themeData == ThemeData.dark().obs;

  void changeTheme() {
    if (isDark) {
      themeData = ThemeData.light().obs;
    } else {
      themeData = ThemeData.dark().obs;
    }
  }
}
