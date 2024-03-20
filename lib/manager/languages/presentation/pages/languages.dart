import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/image_assets.dart';
import 'package:shop/core/localization/change_local.dart';
import 'package:shop/manager/languages/presentation/widgets/button_to_choose_language.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/routes.dart';
import '../widgets/description_language_widget.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DescriptionOfLanguageWidget(),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * .25,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width20, vertical: height20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonToChooseLanguage(
                        imagePath: ImageAssets.usaFlag,
                        textButton: "English",
                        backgroundColor: const Color(0xff0343cb),
                        textColor: AppColors.white,
                        onPressed: () {
                          controller.changeLanguage("EN");
                          Get.toNamed(AppRoutes.onboarding);
                        },
                      ),
                      sizeVertical(height20),
                      ButtonToChooseLanguage(
                        imagePath: ImageAssets.franceFlag,
                        textButton: "French",
                        backgroundColor: const Color(0xffdde5f7),
                        textColor: const Color(0xff0343cb),
                        onPressed: () {
                          controller.changeLanguage("FR");
                          Get.toNamed(AppRoutes.onboarding);
                        },
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
