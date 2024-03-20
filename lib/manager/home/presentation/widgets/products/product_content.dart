import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/text_substring.dart';
import 'package:shop/core/functions/translate_database.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';

class ProductContent extends GetView<HomeControllerImpl> {
  final ProductModel productModel;
  const ProductContent({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    Get.put(FavoriteControllerImpl());
    return GestureDetector(
      onTap: () {
        controller.goToDetailProduct(productModel);
      },
      child: Padding(
        padding: EdgeInsets.only(left: width5, right: width5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * .25,
              width: screenWidth * .4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius5),
                  image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
            ),
            Row(
              children: [
                Container(
                  width: screenWidth * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeVertical(height3),
                      TextApp(
                        text:
                            "${translateDatabase(productModel.productNameFr, productModel.productName)}"
                                .intelliTrim(),
                        fontSize: font14,
                        color: Colors.grey[700],
                      ),
                      TextApp(
                        text: "${double.parse(productModel.countPrice!)} DH",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                productModel.productDiscount != 0
                    ? Container(
                        decoration: BoxDecoration(
                            color: AppColors.starColor,
                            borderRadius: BorderRadius.circular(radius5)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width5, vertical: height3),
                            child: TextApp(
                              text: "-${productModel.productDiscount}%",
                              fontSize: font12,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
