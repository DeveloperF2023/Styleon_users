import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/services/services.dart';

import '../../static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImpl extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  AppServices appServices = Get.find();
  String? endText;
  @override
  next() {
    currentPage++;
    if (currentPage > contents.length - 1) {
      endText = "Let's GO";
      appServices.sharedPreferences.setString("step", '1');
      Get.offAllNamed(AppRoutes.login);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    endText = "Next";
    super.onInit();
  }
}
