import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../controller/offers/all_offers_controller.dart';

class DotsIndicatorOffers extends StatelessWidget {
  const DotsIndicatorOffers({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllOffersControllerImpl>(builder: (controller) {
      return Container(
        height: 5,
        width: controller.currentPage == index ? 25 : 10,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
      );
    });
  }
}
