import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/offers/all_offers_controller.dart';
import 'banner_content.dart';

class BannerSlider extends GetView<AllOffersControllerImpl> {
  final int currentIndex;
  const BannerSlider({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOffersControllerImpl());
    return PageView.builder(
        controller: controller.pageController,
        itemCount: controller.banners.length,
        onPageChanged: (int index) {
          controller.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return BannerContent(bannerModel: controller.banners[index]);
        });
  }
}
