import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';
import '../dialog_rating.dart';

class ListOfArchiveWidget extends StatelessWidget {
  const ListOfArchiveWidget(
      {super.key,
      required this.orderNumber,
      required this.orderDate,
      required this.status,
      required this.orderFromNow,
      required this.orderId,
      required this.orderRating});
  final String orderNumber;
  final String orderFromNow;
  final String orderDate;
  final String orderId;
  final int orderRating;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height5, horizontal: width10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width15, vertical: height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: orderNumber,
                    fontSize: font16,
                    fontWeight: FontWeight.w600,
                  ),
                  Column(
                    children: [
                      TextApp(
                        text: orderFromNow,
                        fontSize: font14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor!.withOpacity(0.7),
                      ),
                    ],
                  )
                ],
              ),
              sizeVertical(height5),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.primaryColor,
                    size: font12,
                  ),
                  sizeHorizontal(width5),
                  TextApp(
                    text: orderDate,
                    fontSize: font14,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.priceTag,
                    size: font12,
                  ),
                  sizeHorizontal(width5),
                  TextApp(
                    text: status,
                    fontSize: font14,
                  ),
                ],
              ),
              sizeVertical(height5),
              orderId != 0
                  ? Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showDialogOfRating(context, orderId);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius5),
                                color: AppColors.starColor),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width10, vertical: height5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: AppColors.textColor,
                                    size: font16,
                                  ),
                                  sizeHorizontal(width3),
                                  TextApp(
                                    text: "Rating",
                                    fontSize: font14,
                                    color: AppColors.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
