import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shop/manager/checkout/presentation/widgets/detail_order/title_single_detail.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class SubtotalOfSingleOrder extends StatelessWidget {
  const SubtotalOfSingleOrder({
    super.key,
    required this.title,
    required this.orderName,
    required this.orderDescription,
    this.onTap,
    this.isArrow = false,
    this.isOpen = false,
    this.totalPrice,
    this.valueTotalPrice,
    this.deliveryPrice,
    this.valueDeliveryPrice,
    this.discountCoupon,
    this.valueDiscountCoupon,
  });
  final String title;
  final String orderName;
  final String orderDescription;
  final void Function()? onTap;
  final bool? isArrow;
  final bool? isOpen;
  final String? totalPrice;
  final String? valueTotalPrice;
  final String? deliveryPrice;
  final String? valueDeliveryPrice;
  final String? discountCoupon;
  final String? valueDiscountCoupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10, vertical: height10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: screenHeight * .05,
                    width: screenWidth * .26,
                    child: TitleOfSingleDetail(title: title)),
                isOpen == false
                    ? sizeHorizontal(width42 * 6)
                    : sizeHorizontal(width42 * 6),
                isArrow == true
                    ? InkWell(
                        onTap: onTap,
                        child: Icon(
                          isOpen == true
                              ? EneftyIcons.arrow_down_outline
                              : EneftyIcons.arrow_right_3_outline,
                          size: font25,
                          color: AppColors.textColor,
                        ))
                    : Container(),
              ],
            ),
            isOpen == true ? sizeVertical(height10) : sizeVertical(0),
            isOpen == true
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                              text: totalPrice!,
                              fontSize: font14,
                              color: AppColors.textColor!.withOpacity(0.5),
                            ),
                            TextApp(
                              text: valueTotalPrice!,
                              fontSize: font14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                              text: deliveryPrice!,
                              fontSize: font14,
                              color: AppColors.textColor!.withOpacity(0.5),
                            ),
                            TextApp(
                              text: valueDeliveryPrice!,
                              fontSize: font14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                              text: discountCoupon!,
                              fontSize: font14,
                              color: AppColors.textColor!.withOpacity(0.5),
                            ),
                            TextApp(
                              text: valueDiscountCoupon!,
                              fontSize: font14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
