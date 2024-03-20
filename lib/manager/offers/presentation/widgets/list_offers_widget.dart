import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/text_substring.dart';
import 'package:shop/manager/offers/controller/offers_controller.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/products_model.dart';
import '../../../global/text_app.dart';

class ListOfOffersWidget extends GetView<OffersControllerImpl> {
  const ListOfOffersWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImpl());
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {
                  controller.goToDetailProduct(productModel);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .22,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
                ),
              ),
              Positioned(
                  top: height10,
                  left: width10,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius5),
                            color: const Color(0xffD4AC0D)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width10, vertical: height5),
                          child: TextApp(
                            text: "-${productModel.productDiscount}%",
                            fontSize: 10,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                      ),
                      sizeHorizontal(width5),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius5),
                            color: AppColors.white),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width10, vertical: height5),
                          child: TextApp(
                            text:
                                "${controller.checkProductStock(productModel.productStock!)}",
                            fontSize: 10,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                      ),
                    ],
                  ))
            ],
          ),
          sizeVertical(height5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width5, vertical: height3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: font14,
                              color: AppColors.white,
                            ),
                            sizeHorizontal(width5),
                            TextApp(
                              text:
                                  "${int.parse("${controller.deliveryTime}")} min",
                              fontWeight: FontWeight.w600,
                              fontSize: font12,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              TextApp(
                text: '${productModel.productName}'.intelliTrim(),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
              TextApp(
                text: '${double.parse("${productModel.countPrice}")} DH',
                fontSize: font16,
                fontWeight: FontWeight.w800,
                color: Colors.grey[700],
              ),
            ],
          )
        ]));
  }
}
