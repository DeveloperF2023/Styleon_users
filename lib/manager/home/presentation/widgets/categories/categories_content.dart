import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shop/core/functions/translate_database.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/category_model.dart';
import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';

class CategoriesContent extends GetView<HomeControllerImpl> {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesContent(this.index,
      {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width10),
      child: GestureDetector(
        onTap: () {
          controller.goToProduct(controller.categories, index,
              categoriesModel.categoryId.toString());
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width5 / 2),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    '${ApiConstants.IMAGE_CATEGORIES}/${categoriesModel.categoryImage}'),
              ),
            ),
            sizeVertical(height5),
            TextApp(
              text:
                  "${translateDatabase(categoriesModel.categoryNameFr, categoriesModel.categoryName)}",
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}
