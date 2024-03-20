import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/text_substring.dart';
import 'package:shop/core/functions/translate_database.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../../global/text_app.dart';

class DiscountProductContent extends StatelessWidget {
  const DiscountProductContent({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * .25,
                width: screenWidth * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(radius10),
                      topLeft: Radius.circular(radius10),
                    ),
                    image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
              ),
              Positioned(
                  top: height10,
                  right: width10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(radius5)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width5, vertical: height3),
                      child: TextApp(
                        text: "NEW",
                        color: AppColors.primaryColor,
                        fontSize: font12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
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
                fontSize: font16,
                color: Colors.grey[700],
              ),
              TextApp(
                text: "\$ ${productModel.productPrice}",
                fontSize: font14,
                fontWeight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
