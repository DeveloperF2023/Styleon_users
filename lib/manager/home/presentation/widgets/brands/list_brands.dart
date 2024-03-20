import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/home/controller/home_controller.dart';

import '../../../../../core/constants/dimensions.dart';
import '../all_offers/list_brands.dart';

class BrandsSection extends GetView<HomeControllerImpl> {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: SizedBox(
        height: screenHeight * .15,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.brands.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListOfBrands(
                brandsModel: controller.brands[index],
              );
            }),
      ),
    );
  }
}
