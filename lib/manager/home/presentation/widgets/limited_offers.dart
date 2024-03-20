import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../controller/home_controller.dart';

class LimitedOffers extends StatelessWidget {
  const LimitedOffers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return SizedBox(
        height: screenHeight * .26,
        width: screenWidth,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            ///First banner
            Container(
              height: screenHeight * .26,
              width: screenWidth,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width10, right: width10),
                    child: CachedNetworkImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${ApiConstants.BACKGROUND_BANNERS}${controller.firstBannerBackgroundImages}",
                      imageBuilder: (context, provider) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius10),
                              image: DecorationImage(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${ApiConstants.BACKGROUND_BANNERS}${controller.firstBannerBackgroundImages}"))),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      right: width20,
                      bottom: -height15,
                      child: CachedNetworkImage(
                        height: screenHeight * .3,
                        width: screenWidth * .5,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        imageUrl:
                            "${ApiConstants.IMAGE_BANNERS}/${controller.firstBannerImage}",
                        imageBuilder: (context, provider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius10),
                                image: DecorationImage(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${ApiConstants.IMAGE_BANNERS}/${controller.firstBannerImage}"))),
                          );
                        },
                      )),
                  Positioned(
                    top: height42 * 1.2,
                    left: width20 * 1.5,
                    child: Text(
                      "${controller.firstBannerTitle}".toUpperCase(),
                      style: GoogleFonts.cabin(
                        color: Color(0xffE67E22),
                        fontWeight: FontWeight.w800,
                        fontSize: font25 * 2,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height42 * 2.3,
                    left: width20 * 1.5,
                    child: Text(
                      "${controller.firstBannerTitle1}".toUpperCase(),
                      style: GoogleFonts.cabin(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: font25 * 2,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height42 * 3.7,
                    left: width20 * 1.7,
                    child: Container(
                      height: height32,
                      decoration: BoxDecoration(
                        color: Color(0xffE67E22),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${controller.firstBannerSubtitle}".toUpperCase(),
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: font20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: height20,
                      left: width20 * 1.5,
                      child: Column(
                        children: [
                          Text(
                            "${controller.firstBannerSubtitle1}",
                            style: GoogleFonts.msMadi(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: font25 * 1.5,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            ///Second banner
            Container(
              height: screenHeight * .26,
              width: screenWidth,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width10, right: width10),
                    child: CachedNetworkImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${ApiConstants.BACKGROUND_BANNERS}${controller.secondBannerBackgroundImages}",
                      imageBuilder: (context, provider) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius10),
                              image: DecorationImage(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${ApiConstants.BACKGROUND_BANNERS}${controller.secondBannerBackgroundImages}"))),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      top: height10,
                      left: width10,
                      bottom: height20,
                      child: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        imageUrl:
                            "${ApiConstants.IMAGE_BANNERS}/${controller.secondBannerImage}",
                        imageBuilder: (context, provider) {
                          return Container(
                            height: screenHeight * .25,
                            width: screenWidth * .5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius10),
                                image: DecorationImage(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${ApiConstants.IMAGE_BANNERS}/${controller.secondBannerImage}"))),
                          );
                        },
                      )),
                  Positioned(
                      right: width32,
                      top: height42 * 1.5,
                      child: Text(
                        "${controller.secondBannerTitle}".toUpperCase(),
                        style: GoogleFonts.cabin(
                          color: AppColors.starColor,
                          fontWeight: FontWeight.w800,
                          fontSize: font25 * 1.5,
                        ),
                      )),
                  Positioned(
                      right: width20,
                      top: height42 * 2.2,
                      child: Text(
                        "${controller.secondBannerTitle1}".toUpperCase(),
                        style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: font25 * 1.8,
                        ),
                      )),
                  Positioned(
                      right: width32,
                      top: height32,
                      child: Text(
                        "${controller.secondBannerSubtitle1}",
                        style: GoogleFonts.msMadi(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: font25 * 2,
                        ),
                      )),
                  Positioned(
                      bottom: height42,
                      right: width30,
                      child: Container(
                        height: height32,
                        decoration: BoxDecoration(color: AppColors.starColor),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "${controller.secondBannerSubtitle}"
                                  .toUpperCase(),
                              style: GoogleFonts.cabin(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: font22,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),

            ///Third banner
            Container(
              height: screenHeight * .26,
              width: screenWidth,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width10, right: width10),
                    child: CachedNetworkImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${ApiConstants.BACKGROUND_BANNERS}${controller.fourthBannerBackgroundImages}",
                      imageBuilder: (context, provider) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius10),
                              image: DecorationImage(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${ApiConstants.BACKGROUND_BANNERS}${controller.fourthBannerBackgroundImages}"))),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      right: width20,
                      bottom: -height10,
                      child: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        imageUrl:
                            "${ApiConstants.IMAGE_BANNERS}/${controller.thirdBannerImage}",
                        imageBuilder: (context, provider) {
                          return Container(
                            height: screenHeight * .2,
                            width: screenWidth * .6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius10),
                                image: DecorationImage(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${ApiConstants.IMAGE_BANNERS}/${controller.thirdBannerImage}"))),
                          );
                        },
                      )),
                  Positioned(
                      top: height32,
                      left: width20,
                      child: Text(
                        "${controller.thirdBannerTitle}",
                        style: GoogleFonts.permanentMarker(
                            fontSize: font25 * 2.3,
                            color: AppColors.priceTag,
                            fontWeight: FontWeight.w500),
                      )),
                  Positioned(
                      top: height42 * 2,
                      left: width20,
                      child: Text(
                        "${controller.thirdBannerTitle1}",
                        style: GoogleFonts.dancingScript(
                            fontSize: font25 * 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      )),
                  Positioned(
                      top: height42 * 3.1,
                      left: width20,
                      child: Container(
                        height: height42,
                        decoration: BoxDecoration(color: AppColors.starColor),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${controller.thirdBannerSubtitle}".toUpperCase(),
                              style: GoogleFonts.cabin(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: font25,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
