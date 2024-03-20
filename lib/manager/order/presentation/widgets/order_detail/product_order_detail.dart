import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class ProductSectionOfOrderDetail extends StatelessWidget {
  const ProductSectionOfOrderDetail(
      {super.key,
      this.isOpenItem,
      this.onTapOpenItem,
      required this.productName,
      required this.productQuantity,
      required this.productPriceOfAllOrder,
      required this.imageUrl,
      required this.totalPrice,
      required this.productRating,
      required this.deliveryPrice,
      required this.productStock,
      required this.productPrice});
  final bool? isOpenItem;
  final void Function()? onTapOpenItem;
  final String productName;
  final String productQuantity;
  final String productStock;
  final String productRating;
  final String productPriceOfAllOrder;
  final String productPrice;
  final String totalPrice;
  final String deliveryPrice;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: screenHeight * .12,
                width: screenWidth * .18,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                    borderRadius: BorderRadius.circular(radius10)),
              ),
              sizeHorizontal(width10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: productName,
                    fontSize: font18,
                    color: AppColors.textColor,
                  ),
                  Row(
                    children: [
                      TextApp(
                        text: "Quantity: ",
                        fontSize: font16,
                        color: AppColors.textColor!.withOpacity(0.7),
                      ),
                      TextApp(
                        text: productQuantity,
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                      sizeHorizontal(width10),
                      TextApp(
                        text: "Stock: ",
                        fontSize: font16,
                        color: AppColors.textColor!.withOpacity(0.7),
                      ),
                      TextApp(
                        text: productStock,
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextApp(
                        text: "1X Product: ",
                        fontSize: font16,
                        color: AppColors.textColor!.withOpacity(0.7),
                      ),
                      TextApp(
                        text: productPrice,
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: AppColors.starColor, size: font20),
                      sizeHorizontal(width5),
                      TextApp(
                        text: productRating,
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          TextApp(
            text: productPriceOfAllOrder,
            fontSize: font18,
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
          )
        ],
      ),
    );
  }
}
