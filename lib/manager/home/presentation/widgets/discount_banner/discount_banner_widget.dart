import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/core/constants/api_constants.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';

class DiscountBannerHome extends GetView<HomeControllerImpl> {
  const DiscountBannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * .18,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
        Positioned(
            right: 0,
            child: Container(
              height: screenHeight * .18,
              width: screenWidth * .5,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: height15,
                  left: width42 * 1.1,
                ),
                child: Text(
                  "BLACK",
                  style: GoogleFonts.roboto(
                      fontSize: font25 * 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )),
        Positioned(
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: height42 * 1.3, right: width30),
              child: Text(
                "FRIDAY",
                style: GoogleFonts.roboto(
                    fontSize: font25 * 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            )),
        Positioned(
            right: 0,
            child: Padding(
              padding:
                  EdgeInsets.only(top: height42 * 1.6, right: width42 * 1.3),
              child: Text(
                "Sale",
                style: GoogleFonts.dancingScript(
                    fontSize: font25 * 1.8,
                    color: AppColors.starColor,
                    fontWeight: FontWeight.w800),
              ),
            )),
        Positioned(
            left: 0,
            child: Container(
              height: screenHeight * .18,
              width: screenWidth * .5,
              decoration: BoxDecoration(
                color: Color(0xff283747),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width30, top: height15),
                child: Text(
                  "20%",
                  style: GoogleFonts.roboto(
                      fontSize: font25 * 1.9,
                      color: AppColors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )),
        Positioned(
          left: 0,
          child: Padding(
            padding: EdgeInsets.only(left: width30, top: height42 * 1.3),
            child: Text(
              "OFF",
              style: GoogleFonts.roboto(
                  fontSize: font25 * 1.9,
                  color: AppColors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 10,
          child: Padding(
              padding: EdgeInsets.only(left: width30, top: height42 * 2.7),
              child: Container(
                height: height30,
                width: screenWidth * .25,
                color: AppColors.white,
                child: Center(
                  child: TextApp(
                    text: "PROMO",
                    fontSize: font22,
                    color: const Color(0xff283747),
                  ),
                ),
              )),
        ),
        Positioned(
            top: -screenHeight * .01,
            right: screenWidth * .37,
            child: Container(
              height: screenHeight * .2,
              width: screenWidth * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${ApiConstants.IMAGE_BANNERS}/${controller.imageBanner}"))),
            )),
      ],
    );
  }
}
