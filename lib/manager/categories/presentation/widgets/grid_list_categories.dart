import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/text_substring.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/products_model.dart';
import '../../../global/text_app.dart';
import '../../controller/product_controller.dart';

class GridViewOfCategories extends StatelessWidget {
  const GridViewOfCategories({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImpl());
    return GetBuilder<ProductControllerImpl>(builder: (controller) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: "${product.productId}",
                  child: GestureDetector(
                    onTap: () {
                      controller.goToDetailProductPage(product);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .22,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${ApiConstants.IMAGE_ITEMS}/${product.productImage}'))),
                    ),
                  ),
                ),
                product.productDiscount != 0
                    ? Positioned(
                        top: height10,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(radius5),
                                bottomRight: Radius.circular(radius5)),
                            color: AppColors.starColor.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width10, vertical: height5),
                              child: TextApp(
                                text: '${product.productDiscount}%',
                                color: AppColors.starColor,
                                fontSize: font14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ))
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
            sizeVertical(height5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: '\$${double.parse(product.countPrice!)}',
                  fontSize: font18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
                TextApp(
                  text: '${product.productName}'.intelliTrim(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ],
            )
          ]));
    });
  }
}
