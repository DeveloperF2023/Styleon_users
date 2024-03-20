import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../model/category_model.dart';
import '../../controller/product_controller.dart';
import 'categories_product_content.dart';

class CategoriesOfProductListView extends GetView<ProductControllerImpl> {
  const CategoriesOfProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .06,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CategoriesOfProductContent(
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
                index);
          }),
    );
  }
}
