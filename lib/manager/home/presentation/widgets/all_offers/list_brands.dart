import 'package:flutter/material.dart';
import 'package:shop/core/constants/api_constants.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../model/brands_model.dart';
import '../../../../global/text_app.dart';

class ListOfBrands extends StatelessWidget {
  final BrandsModel brandsModel;
  const ListOfBrands({super.key, required this.brandsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width30),
      child: Column(
        children: [
          Container(
            height: screenHeight * .1,
            width: screenWidth * .21,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${ApiConstants.IMAGE_BRANDS}/${brandsModel.brandsImages}"))),
          ),
          sizeVertical(height10),
          TextApp(
            text: "${brandsModel.brandsTitle}",
            fontSize: font18,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
