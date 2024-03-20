import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';

import '../../controller/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(
              fontSize: 50.0,
              fontFamily: 'Nunito',
              color: AppColors.textColor,
              fontWeight: FontWeight.w700),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('StyleOn'),
            ],
            isRepeatingAnimation: false,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}
