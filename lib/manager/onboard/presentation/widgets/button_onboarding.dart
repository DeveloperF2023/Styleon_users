import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';
import '../../controller/onboarding/onboarding_controller.dart';

class CustomButtonOnboarding extends GetView<OnboardingControllerImpl> {
  const CustomButtonOnboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.next();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius10)),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width10, vertical: height10),
              child: TextApp(
                text: '4'.tr,
                color: Colors.black,
                fontSize: font18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
