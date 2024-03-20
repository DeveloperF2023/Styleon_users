import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../model/products_model.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../../global/text_app.dart';
import '../../../controller/offers/all_offers_controller.dart';

class ContentOfSearchList extends GetView<AllOffersControllerImpl> {
  final ProductModel productModel;
  const ContentOfSearchList({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOffersControllerImpl());
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: [
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
                  bottom: -height20,
                  right: width10,
                  child: Container(
                    alignment: Alignment.center,
                    height: height42,
                    width: width42,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: GetBuilder<FavoriteControllerImpl>(
                        builder: (favController) {
                      return Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              shape: BoxShape.circle),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (favController
                                        .isFavorite[productModel.productId]
                                        .toString() ==
                                    "1") {
                                  favController.setFavorite(
                                      "${productModel.productId}", "0");
                                  favController.removeFromFavorite(
                                      "${productModel.productId}");
                                } else {
                                  favController.setFavorite(
                                      "${productModel.productId}", "1");
                                  favController.addToFavorite(
                                      "${productModel.productId}");
                                }
                              },
                              child: Icon(
                                favController.isFavorite[productModel.productId]
                                            .toString() ==
                                        "1"
                                    ? Icons.favorite
                                    : Icons.favorite_outline_outlined,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                          ));
                    }),
                  )),
              Positioned(
                  top: height10,
                  left: width10,
                  child: Row(
                    children: [
                      productModel.productDiscount != 0
                          ? Container(
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
                            )
                          : SizedBox(),
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
          Positioned(
            bottom: height15,
            left: width5,
            right: 0,
            child: Column(
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
                sizeVertical(height5),
                TextApp(
                  text: '${productModel.productName}',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
                TextApp(
                  text: '\$${double.parse("${productModel.countPrice}")}',
                  fontSize: font16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700],
                ),
              ],
            ),
          )
        ]));
  }
}
