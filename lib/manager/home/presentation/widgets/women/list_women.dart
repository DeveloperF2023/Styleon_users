import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../model/products_model.dart';
import '../../../controller/home_controller.dart';
import 'content_women_list.dart';

class ListOfWomen extends StatelessWidget {
  const ListOfWomen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return SizedBox(
        height: screenHeight * .32,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.women.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContentOfList(
                  productModel: ProductModel.fromJson(controller.women[index]),
                );
              }),
        ),
      );
    });
  }
}
