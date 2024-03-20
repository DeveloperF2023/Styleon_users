import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/home/presentation/widgets/top_selling/top_selling_content.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../controller/home_controller.dart';

class ListOfTopSelling extends GetView<HomeControllerImpl> {
  const ListOfTopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return SizedBox(
        height: screenHeight * .25,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.topSelling.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ContentOfTopSelling(
                productModel:
                    ProductModel.fromJson(controller.topSelling[index]),
              );
            }),
      );
    });
  }
}
