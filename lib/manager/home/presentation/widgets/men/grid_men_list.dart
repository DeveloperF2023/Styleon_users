import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../controller/home_controller.dart';
import '../women/content_women_list.dart';

class GridOfMenList extends StatelessWidget {
  const GridOfMenList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: SizedBox(
          height: screenHeight * .32,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.men.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContentOfList(
                  productModel: ProductModel.fromJson(controller.men[index]),
                );
              }),
        ),
      );
    });
  }
}
