import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/routes.dart';

class SplashController extends GetxController {
  final List<Color> colorizeColors = [
    AppColors.primaryColor,
    AppColors.secondaryColor,
    AppColors.starColor,
  ];

  TextStyle colorizeTextStyle = TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.w800,
    fontFamily: 'Nunito',
  );
  @override
  void onInit() {
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(AppRoutes.language);
    });
    super.onInit();
  }
}
