import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/order_model.dart';
import '../../../global/text_app.dart';
import '../../controller/orders_controller.dart';

class ListOrderWidget extends GetView<OrderControllerImpl> {
  const ListOrderWidget({
    super.key,
    required this.orders,
  });
  final OrderModel orders;
  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImpl());
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
                    text: "Order #${orders.ordersId}",
                    fontSize: font16,
                    fontWeight: FontWeight.w600,
                  ),
                  Column(
                    children: [
                      TextApp(
                        text: Jiffy.parse(orders.ordersDate!).fromNow(),
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
                    text:
                        "Order Type: ${controller.typeOfOrder("${orders.ordersType}")}",
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
                    text:
                        "Status Order: ${controller.statusOfOrder("${orders.ordersStatus!}")}",
                    fontSize: font14,
                  ),
                ],
              ),
              sizeVertical(height10),
              orders.ordersStatus == 3
                  ? GestureDetector(
                      onTap: () {
                        controller.goToTrackingOrder(orders);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(radius5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width5, vertical: height3),
                          child: TextApp(
                            text: "Tracking",
                            color: AppColors.white,
                            fontSize: font12,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
