import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class HeaderOfAllOffers extends StatelessWidget {
  const HeaderOfAllOffers({super.key, this.onFavorite, required this.username});
  final void Function()? onFavorite;
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .1,
      width: double.infinity,
      margin: EdgeInsets.only(right: width10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: screenWidth * .12,
                  height: screenHeight * .06,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(
                      EneftyIcons.arrow_left_3_outline,
                      color: AppColors.textColor,
                      size: font22,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width32),
                      child: TextApp(
                        text: username.toUpperCase(),
                        fontSize: font14,
                        color: AppColors.textColor!.withOpacity(0.7),
                      ),
                    ),
                    TextApp(
                      text: "✨All Offers",
                      fontSize: font25,
                      color: AppColors.textColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onFavorite,
            child: Container(
              width: screenWidth * .12,
              height: screenHeight * .06,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  EneftyIcons.heart_outline,
                  color: AppColors.white,
                  size: font22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
