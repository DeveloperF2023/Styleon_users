import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';
import '../../controller/onboarding/onboarding_controller.dart';
import '../../static/static.dart';
import '../widgets/button_onboarding.dart';
import '../widgets/custom_slider_onboarding.dart';
import '../widgets/dots_indicator.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          CustomSliderOnboarding(currentIndex),
          Positioned(
            bottom: height10,
            left: 0,
            right: 0,
            child: const CustomButtonOnboarding(),
          ),
          Positioned(
            bottom: height10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => DotsIndicator(index: index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
