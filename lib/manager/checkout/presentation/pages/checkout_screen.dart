import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/class/stripe_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../../global/app_bar.dart';
import '../../../global/text_app.dart';
import '../../controller/checkout_controller.dart';
import '../widgets/address_container.dart';
import '../widgets/delivery_container.dart';
import '../widgets/payment_container.dart';
import '../widgets/row_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImpl());
    return GetBuilder<CheckoutControllerImpl>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: width10),
              child: SizedBox(
                height: screenHeight * .05,
                width: double.infinity,
                child: FloatingActionButton.extended(
                    elevation: 0,
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      controller.goToDetailOrder();
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
            appBar: AppBarWidget(
              title: "Checkout",
              automaticallyImplyLeading: true,
              onPressed: () {
                Get.back();
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width20, vertical: height10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: "PAYMENT METHOD",
                        color: AppColors.textColor,
                        fontSize: font18,
                      ),
                      sizeVertical(height10),
                      TextApp(
                        text:
                            "You will not be charged until you review this order",
                        color: AppColors.textColor,
                        fontSize: font16,
                        fontWeight: FontWeight.w600,
                      ),
                      sizeVertical(height10),
                      SizedBox(
                        height: screenHeight * .215,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  PaymentContainer(
                                    isCreditCard: true,
                                    icon: Icons.payment,
                                    isActive: controller.paymentMethod != "1"
                                        ? false
                                        : true,
                                    onChoosePaymentMethod: () {
                                      print("card");
                                      controller.choosePaymentMethod("1");
                                      StripeManager.makePayment(
                                          controller.totalPrice!.toInt(),
                                          "MAD");
                                    },
                                  ),
                                  sizeHorizontal(width10),
                                  PaymentContainer(
                                    isCreditCard: false,
                                    icon: Icons.payment,
                                    isActive: controller.paymentMethod != "0"
                                        ? false
                                        : true,
                                    onChoosePaymentMethod: () {
                                      print("card");
                                      controller.choosePaymentMethod("0");

                                      ///0 => Cash
                                    },
                                  ),
                                ],
                              );
                            }),
                      ),
                      sizeVertical(height20),
                      TextApp(
                        text: "DELIVERY ESTIMATE",
                        color: AppColors.textColor,
                        fontSize: font18,
                      ),
                      sizeVertical(height10),
                      Column(
                        children: [
                          DeliveryContainer(
                            icon: EneftyIcons.truck_fast_outline,
                            typeOfDelivery: "Delivery",
                            timeOfDelivery: "30-40 min",
                            isActive:
                                controller.deliveryType == "0" ? true : false,
                            onChooseTypeOfDelivery: () {
                              controller.chooseDeliveryType("0");

                              ///0 => Delivery
                            },
                          ),
                          sizeVertical(height10),
                          DeliveryContainer(
                            icon: EneftyIcons.receive_square_2_outline,
                            typeOfDelivery: "Receive",
                            timeOfDelivery: "Same Day",
                            isActive:
                                controller.deliveryType == "1" ? true : false,
                            onChooseTypeOfDelivery: () {
                              controller.chooseDeliveryType("1");
                            },
                          ),
                        ],
                      ),
                      sizeVertical(height20),
                      controller.deliveryType != "1"
                          ? AddressRow(
                              onAddNewAddress: () {
                                controller.goToAddNewAddress();
                              },
                            )
                          : Container(),
                      sizeVertical(height20),
                      controller.deliveryType != "1"
                          ? SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: height42),
                                child: ListView.builder(
                                    itemCount: controller.data.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return AddressContainer(
                                        nameOfAddress:
                                            controller.data[index].addressName!,
                                        cityOfAddress:
                                            "${controller.data[index].addressCity}",
                                        streetOfAddress:
                                            "${controller.data[index].addressStreet}",
                                        isActive: controller.addressID ==
                                                "${controller.data[index].addressId}"
                                            ? true
                                            : false,
                                        onChooseAddress: () {
                                          controller.chooseShippingAddress(
                                              "${controller.data[index].addressId}");
                                        },
                                        onEditAddress: () {},
                                      );
                                    }),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
