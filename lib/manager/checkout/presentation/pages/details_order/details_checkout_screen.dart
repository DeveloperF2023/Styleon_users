import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../global/app_bar.dart';
import '../../../../global/text_app.dart';
import '../../../controller/detail_order/detail_order_controller.dart';
import '../../widgets/detail_order/container_single_order.dart';
import '../../widgets/detail_order/header_widget.dart';
import '../../widgets/detail_order/subtotal_single_order.dart';
import '../../widgets/detail_order/total_price_widget.dart';

class DetailsOrderScreen extends StatelessWidget {
  const DetailsOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailOrderControllerImpl());
    return GetBuilder<DetailOrderControllerImpl>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            appBar: AppBarWidget(
              title: "Checkout",
              automaticallyImplyLeading: true,
              onPressed: () => Get.back(),
            ),
            backgroundColor: AppColors.white,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: width10),
              child: Container(
                height: screenHeight * .05,
                width: double.infinity,
                child: FloatingActionButton.extended(
                    elevation: 0,
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      controller.checkoutOrder();
                    },
                    label: TextApp(
                      text: "Confirm",
                      color: AppColors.white,
                      fontSize: font18,
                    )),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HeaderOfOrderWidget(),
                  //const ContainerOfAddressSingleDetail(),
                  ContainerOfSingleOrder(
                    title: "DELIVERY",
                    orderName: "Type of Delivery",
                    orderDescription:
                        controller.deliveryType == "0" ? "Delivery" : "Receive",
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: AppColors.backGreyColor,
                  ),
                  ContainerOfSingleOrder(
                      title: "PAYMENT",
                      orderName: "Type of payment",
                      orderDescription: controller.paymentMethod == "0"
                          ? "Cash"
                          : "Credit Card"),
                  const Divider(
                    thickness: 1.5,
                    color: AppColors.backGreyColor,
                  ),
                  ContainerOfSingleOrder(
                    title: "ITEMS",
                    orderName: "Items",
                    orderDescription: "${controller.totalProducts}",
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: AppColors.backGreyColor,
                  ),
                  SubtotalOfSingleOrder(
                    title: "SUBTOTAL",
                    orderName: "Subtotal",
                    orderDescription: "\$${controller.orderPrice}",
                    isArrow: true,
                    isOpen: controller.isOpen,
                    onTap: () {
                      controller.selectArrowButton();
                    },
                    totalPrice: "${controller.totalProducts}X Products",
                    valueTotalPrice: "\$${controller.totalPrice}",
                    deliveryPrice: "Delivery price",
                    valueDeliveryPrice: controller.deliveryType == "0"
                        ? "\$${controller.priceDelivery}"
                        : "\$0",
                    discountCoupon: "Coupon",
                    valueDiscountCoupon: "${controller.couponName}",
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: AppColors.backGreyColor,
                  ),
                  TotalPriceWidget(
                      title: "TOTAL",
                      totalPrice: controller.deliveryType == "0"
                          ? "\$${controller.priceOrder!.toString()}"
                          : "\$${controller.totalPrice}")
                ],
              ),
            )),
          ));
    });
  }
}
