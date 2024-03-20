import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/text_substring.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../../model/products_model.dart';
import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';

class ContentOfTopSelling extends GetView<HomeControllerImpl> {
  final ProductModel productModel;
  const ContentOfTopSelling({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    return GestureDetector(
      onTap: () {
        controller.goToDetailProduct(productModel);
      },
      child: Padding(
        padding: EdgeInsets.only(left: width10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * .18,
                  width: screenWidth * .45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius10),
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
                ),
                productModel.productDiscount != 0
                    ? Positioned(
                        top: height10,
                        left: width10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(radius5)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width10, vertical: height3),
                              child: TextApp(
                                text: "-${productModel.productDiscount}%",
                                fontSize: font12,
                                color: AppColors.starColor,
                              ),
                            ),
                          ),
                        ))
                    : Container(),
              ],
            ),
            Column(
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
                  text: "${double.parse("${productModel.countPrice}")} DH",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
