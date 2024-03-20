import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/category_model.dart';
import '../../../controller/home_controller.dart';
import 'all_categories_content.dart';

class AllCategoriesList extends GetView<HomeControllerImpl> {
  const AllCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: height5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.categories.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AllCategoriesContent(
                    categoriesModel:
                        CategoriesModel.fromJson(controller.categories[index]));
                //return CategoriesContent(categoriesModel: CategoriesModel.fromJson(controller.categories[index]),index);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 160)),
        ),
      ),
    );
  }
}
