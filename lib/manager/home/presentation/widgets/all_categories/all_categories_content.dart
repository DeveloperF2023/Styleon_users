import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../model/category_model.dart';
import '../../../../global/text_app.dart';

class AllCategoriesContent extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const AllCategoriesContent({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(clipBehavior: Clip.none, children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .18,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${ApiConstants.IMAGE_CATEGORIES}/${categoriesModel.categoryImage}'))),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .18,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(radius10)),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * .07,
                  bottom: MediaQuery.of(context).size.height * .07,
                  left: width10,
                  right: width10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp(
                        text: "${categoriesModel.categoryName}",
                        fontSize: font18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ))
            ],
          ),
        ]));
  }
}
