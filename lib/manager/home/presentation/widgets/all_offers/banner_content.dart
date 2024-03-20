import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/api_constants.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/banner_model.dart';
import '../../../controller/offers/all_offers_controller.dart';

class BannerContent extends GetView<AllOffersControllerImpl> {
  final BannerModel bannerModel;
  const BannerContent({super.key, required this.bannerModel});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOffersControllerImpl());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width10),
          child: Container(
            height: screenHeight * .18,
            width: screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${ApiConstants.IMAGE_BANNERS}/${bannerModel.bannersImage}"))),
          ),
        ),
      ],
    );
  }
}
