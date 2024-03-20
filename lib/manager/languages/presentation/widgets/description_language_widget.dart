import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/image_assets.dart';

class DescriptionOfLanguageWidget extends StatelessWidget {
  const DescriptionOfLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(color: Color(0xfff4f7fc)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height42 * 3.5),
            child: Image.asset(
              ImageAssets.language,
              height: screenHeight * .2,
              width: screenWidth * .5,
            ),
          ),
          sizeVertical(height20),
          Text(
            "Welcome on StyleON".tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: font22,
                color: AppColors.textColor,
                fontWeight: FontWeight.w700),
          ),
          sizeVertical(height20),
          Text(
            "Welcome to StyleON! We want to make \nyour shopping experience as seamless as possible. \nSelect your preferred language below to \nexplore our vast collection of products \nin a language that suits you best."
                .tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: font14,
                color: const Color(0xff67758e),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
