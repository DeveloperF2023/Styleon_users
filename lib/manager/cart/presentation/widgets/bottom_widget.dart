import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/global/form_container.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';
import '../../controller/cart_controller.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalPrice,
      this.onTap,
      required this.couponController,
      this.onTapCoupon});
  final String price;
  final String shipping;
  final String totalPrice;
  final Function()? onTap;
  final TextEditingController couponController;
  final void Function()? onTapCoupon;
  @override
  Widget build(BuildContext context) {
    bool isTaped = false;
    return Column(
      children: [
        GetBuilder<CartControllerImpl>(builder: (controller) {
          return controller.nameCoupon.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: width10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width10, vertical: height20),
                      child: Row(
                        children: [
                          Expanded(
                              child: FormContainer(
                            hintText: "Enter Promo Code",
                            fillColor: Colors.grey[100],
                            isSuffix: false,
                            isPrefix: false,
                            controller: couponController,
                          )),
                          sizeHorizontal(width20),
                          InkWell(
                            onTap: !isTaped ? onTapCoupon : null,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(radius30)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width42, vertical: height10),
                                child: Center(
                                  child: TextApp(
                                    text: "Apply",
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    fontSize: font16,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  height: screenHeight * .1,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp(
                        text: "You are using the coupon ",
                        fontSize: font16,
                        color: AppColors.textColor,
                      ),
                      TextApp(
                        text: "${controller.nameCoupon}",
                        fontSize: font16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                );
        }),
        sizeVertical(height5),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width15, vertical: height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "Price",
                      fontWeight: FontWeight.w600,
                      fontSize: font18,
                      color: AppColors.textColor,
                    ),
                    TextApp(
                      text: price,
                      fontWeight: FontWeight.w700,
                      fontSize: font16,
                      color: AppColors.subtitleColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width15, vertical: height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "Discount",
                      fontWeight: FontWeight.w400,
                      fontSize: font18,
                      color: AppColors.textColor,
                    ),
                    TextApp(
                      text: shipping,
                      fontWeight: FontWeight.w800,
                      fontSize: font16,
                      color: AppColors.subtitleColor,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.2,
                color: AppColors.subtitleColor!.withOpacity(0.2),
              ),
              sizeVertical(height5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<CartControllerImpl>(builder: (controller) {
                          return controller.nameCoupon.isNotEmpty && !isTaped
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xffEAF2F8)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width5, vertical: width5),
                                      child: TextApp(
                                        text: "Coupon",
                                        color: const Color(0xff2980B9),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                        }),
                        TextApp(
                          text: "Total",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                        TextApp(
                          text: totalPrice,
                          fontWeight: FontWeight.w800,
                          fontSize: font20,
                          color: AppColors.textColor!.withOpacity(0.6),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(radius10)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width42, vertical: height10),
                            child: TextApp(
                              text: "Checkout",
                              fontSize: font25,
                              fontWeight: FontWeight.w600,
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
