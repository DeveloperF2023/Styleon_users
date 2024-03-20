import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import 'discount_product_content.dart';

class DiscountProductList extends StatelessWidget {
  const DiscountProductList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailControllerImpl());
    return GetBuilder<ProductDetailControllerImpl>(builder: (controller) {
      return SizedBox(
        height: screenHeight * .31,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.discount.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DiscountProductContent(
                productModel: ProductModel.fromJson(controller.discount[index]),
              );
            }),
      );
    });
  }
}
