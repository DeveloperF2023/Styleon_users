import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/home/presentation/widgets/products/product_content.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../controller/home_controller.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return SizedBox(
        height: screenHeight * .32,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductContent(
                productModel: ProductModel.fromJson(controller.items[index]),
              );
            }),
      );
    });
  }
}
