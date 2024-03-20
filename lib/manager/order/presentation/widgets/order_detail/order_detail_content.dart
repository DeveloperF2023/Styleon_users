import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/order/presentation/widgets/order_detail/product_order_detail.dart';
import 'package:shop/manager/order/presentation/widgets/order_detail/single_order.dart';
import 'package:shop/manager/order/presentation/widgets/order_detail/total_price_order_detail.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';
import '../../../controller/order_details/order_details_controller.dart';
import 'address_order_detail.dart';

class OrderDetailContent extends StatelessWidget {
  const OrderDetailContent(
      {super.key,
      this.isOpen = false,
      this.onOpenAddress,
      this.isOpenItem = false,
      this.onTapOpenItem,
      required this.addressName,
      required this.street,
      required this.dateOrder,
      required this.timeOrder,
      required this.idOrder,
      required this.statusOrder,
      required this.googleContainer,
      required this.typeOrder,
      required this.paymentType,
      this.isMap = true});
  final bool? isOpen;
  final bool? isOpenItem;
  final void Function()? onOpenAddress;
  final void Function()? onTapOpenItem;
  final String addressName;
  final String street;
  final String dateOrder;
  final String timeOrder;
  final String typeOrder;
  final String idOrder;
  final String statusOrder;
  final String paymentType;
  final Container googleContainer;
  final bool? isMap;
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImpl());
    return GetBuilder<OrderDetailsControllerImpl>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.orderModel!.ordersType == 0
                ? googleContainer
                : Container(),
            controller.orderModel!.ordersType == 0
                ? sizeVertical(height42 * 1.2)
                : sizeVertical(height10),
            Card(
              surfaceTintColor: AppColors.white,
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(radius10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width15, vertical: height10),
                  child: Column(
                    children: [
                      SingleOrderDetail(
                          title: "Order Created at", description: dateOrder),
                      Divider(
                        thickness: 1,
                        color: AppColors.subtitleColor,
                      ),
                      SingleOrderDetail(
                          title: "Order Time", description: timeOrder),
                      Divider(
                        thickness: 1,
                        color: AppColors.subtitleColor,
                      ),
                      SingleOrderDetail(
                          title: "Order ID", description: idOrder),
                      Divider(
                        thickness: 1,
                        color: AppColors.subtitleColor,
                      ),
                      SingleOrderDetail(
                          title: "Order Status", description: statusOrder),
                    ],
                  ),
                ),
              ),
            ),
            sizeVertical(height20),
            Card(
              surfaceTintColor: AppColors.white,
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(radius10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width15, vertical: height10),
                  child: Column(
                    children: [
                      SingleOrderDetail(
                          title: "Payment Type", description: paymentType),
                      Divider(
                        thickness: 1,
                        color: AppColors.subtitleColor,
                      ),
                      SingleOrderDetail(
                          title: "Order Type", description: typeOrder),
                    ],
                  ),
                ),
              ),
            ),
            sizeVertical(height20),
            controller.orderModel!.ordersType == 1
                ? Container(
                    height: 0,
                    width: 0,
                  )
                : Card(
                    surfaceTintColor: AppColors.white,
                    elevation: 2,
                    child: AddressOrderDetail(
                      addressName: addressName,
                      street: street,
                      isOpen: isOpen,
                      onOpenAddress: onOpenAddress,
                    ),
                  ),
            sizeVertical(height20),
            Card(
              surfaceTintColor: AppColors.white,
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(radius10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width15, vertical: height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                              text: "Items",
                              fontSize: font16,
                              color: AppColors.textColor!.withOpacity(0.7),
                            ),
                            GestureDetector(
                                onTap: onTapOpenItem,
                                child: Icon(
                                  isOpenItem != false
                                      ? EneftyIcons.arrow_right_3_outline
                                      : EneftyIcons.arrow_down_outline,
                                  color: AppColors.subtitleColor,
                                  size: font22,
                                ))
                          ],
                        ),
                      ),
                      isOpenItem == false
                          ? ListView.builder(
                              itemCount: controller.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProductSectionOfOrderDetail(
                                  productName:
                                      "${controller.data[index].productName}",
                                  productQuantity:
                                      "${controller.data[index].countProducts}",
                                  productPriceOfAllOrder:
                                      "\$${double.parse("${controller.data[index].countPrice}")}",
                                  isOpenItem: isOpenItem,
                                  onTapOpenItem: onTapOpenItem,
                                  imageUrl:
                                      '${ApiConstants.IMAGE_ITEMS}/${controller.data[index].productImage}',
                                  totalPrice:
                                      '\$${double.parse("${controller.data[index].ordersTotalPrice}")}',
                                  productRating:
                                      '${controller.data[index].productRating}',
                                  deliveryPrice:
                                      '\$${controller.data[index].ordersPriceDelivery}',
                                  productStock:
                                      '${controller.data[index].productStock}',
                                  productPrice:
                                      '\$${controller.data[index].productPrice}',
                                );
                              })
                          : Container(),
                      Divider(
                        thickness: 1,
                        color: AppColors.subtitleColor,
                      ),
                      TotalPriceOfOrderDetail(
                        totalPrice: '\$${controller.orderModel!.ordersPrice}',
                        title: 'Total Price',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
