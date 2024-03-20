import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../model/category_model.dart';
import '../../../global/text_app.dart';
import '../../controller/product_controller.dart';

class CategoriesOfProductContent extends GetView<ProductControllerImpl> {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesOfProductContent(this.index,
      {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImpl());
    return Padding(
      padding: EdgeInsets.only(left: width10, right: width10),
      child: GestureDetector(
        onTap: () {
          controller.changeCategory(
              index, categoriesModel.categoryId!.toString());
        },
        child: GetBuilder<ProductControllerImpl>(builder: (controller) {
          return Column(
            children: [
              controller.selectedCategory == index
                  ? Container(
                      height: screenHeight * .05,
                      padding: EdgeInsets.symmetric(horizontal: width10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(radius10),
                      ),
                      child: Center(
                          child: TextApp(
                        text:
                            "${translateDatabase(categoriesModel.categoryNameFr, categoriesModel.categoryName)}",
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      )))
                  : Container(
                      height: screenHeight * .05,
                      padding: EdgeInsets.symmetric(horizontal: width10),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(radius10),
                      ),
                      child: Center(
                          child: TextApp(
                        text:
                            "${translateDatabase(categoriesModel.categoryNameFr, categoriesModel.categoryName)}",
                        fontSize: 15,
                        color: Colors.grey,
                      ))),
            ],
          );
        }),
      ),
    );
  }
}
