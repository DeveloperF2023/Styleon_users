import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/category_model.dart';
import '../../../controller/home_controller.dart';
import 'categories_content.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Container(
        height: screenHeight * .13,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoriesContent(
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[index]),
                  index);
            }),
      );
    });
  }
}
