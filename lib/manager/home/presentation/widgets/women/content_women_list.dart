import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/text_substring.dart';
import 'package:shop/core/functions/translate_database.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';

class ContentOfList extends GetView<HomeControllerImpl> {
  final ProductModel productModel;
  const ContentOfList({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Padding(
      padding: EdgeInsets.only(right: width10),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.goToDetailProduct(productModel);
                  },
                  child: Container(
                    height: screenHeight * .22,
                    width: screenWidth * .4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
                  ),
                ),
                productModel.productDiscount != 0
                    ? Positioned(
                        top: height10,
                        left: width10,
                        child: Row(
                          children: [
                            Container(
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
                            )
                          ],
                        ))
                    : Container(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text:
                      '${translateDatabase(productModel.productName, productModel.productNameFr)}'
                          .intelliTrim(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
                TextApp(
                  text: '${double.parse("${productModel.countPrice}")} DH',
                  fontSize: font16,
                  fontWeight: FontWeight.w700,
                ),
              ],
            )
          ])),
    );
  }
}
