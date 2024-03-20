import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/product_detail/presentation/widgets/user_substring.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../model/rating_detail_model.dart';
import '../../../global/text_app.dart';
import '../../controller/detail_controller.dart';

class RatingListContent extends GetView<ProductDetailControllerImpl> {
  final RatingDetailModel ratingDetailModel;
  const RatingListContent({super.key, required this.ratingDetailModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailControllerImpl());
    return Padding(
      padding: EdgeInsets.only(bottom: height10, left: width5, right: width5),
      child: Container(
        width: screenWidth * .96,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!, width: 1.2),
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width10, vertical: height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      UsernameSubstringWidget(
                          username: controller.getInitials(
                              string: ratingDetailModel.username!.toUpperCase(),
                              limitTo: 1)),
                      sizeHorizontal(width10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextApp(
                                text: ratingDetailModel.username!,
                                fontSize: font16,
                                color: AppColors.textColor,
                              ),
                              sizeHorizontal(width5),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(radius5),
                                    color: Colors.black12),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width5, vertical: height3),
                                  child: Row(
                                    children: [
                                      TextApp(
                                        text: "me",
                                        fontSize: font14,
                                        color: AppColors.starColor,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextApp(
                            text: ratingDetailModel.email!,
                            fontSize: font14,
                            color: AppColors.textColor!.withOpacity(0.5),
                          ),
                        ],
                      )
                    ],
                  ),
                  sizeHorizontal(width42 * 1.5),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius5),
                        color: Colors.black38),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width10, vertical: height3),
                      child: Row(
                        children: [
                          Icon(
                            EneftyIcons.star_bold,
                            color: AppColors.starColor,
                            size: font14,
                          ),
                          TextApp(
                            text: ratingDetailModel.ratingNumber.toString(),
                            fontSize: font14,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              sizeVertical(height20),
              SizedBox(
                width: screenWidth * .9,
                child: TextApp(
                  text: ratingDetailModel.ratingDescription!,
                  fontSize: font14,
                  color: AppColors.textColor,
                ),
              ),
              sizeVertical(height10),
              Container(
                height: screenHeight * .08,
                width: screenWidth * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "${ApiConstants.IMAGE_ITEMS}/${ratingDetailModel.productImage}"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
