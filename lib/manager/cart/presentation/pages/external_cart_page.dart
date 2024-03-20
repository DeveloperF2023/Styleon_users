import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/colors.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/app_bar.dart';
import '../../../global/text_app.dart';
import '../../controller/cart_controller.dart';
import '../widgets/bottom_widgets_external.dart';
import '../widgets/list_cart_widget.dart';

class ExternalCartScreen extends StatelessWidget {
  const ExternalCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImpl());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarWidget(
          title: "Cart",
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<CartControllerImpl>(
          builder: (controller) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .5,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          pinned: true,
                          expandedHeight: 50,
                          automaticallyImplyLeading: false,
                          flexibleSpace: Padding(
                            padding:
                                EdgeInsets.only(left: width10, top: height10),
                            child: Row(
                              children: [
                                TextApp(
                                  text:
                                      "Products ${controller.countItems.toString()}",
                                  fontSize: font20,
                                  color: AppColors.grey600,
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Positioned(
                            top: height20,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                      itemCount: controller.data.length,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ListCartWidget(
                                          imageUrl:
                                              '${ApiConstants.IMAGE_ITEMS}/${controller.data[index].productImage}',
                                          productName:
                                              '${controller.data[index].productName}',
                                          productPrice:
                                              '${double.parse(controller.data[index].countPrice!)}',
                                          onTapTrash: () async {
                                            await controller.removeFromCart(
                                                '${controller.data[index].productId}');
                                            controller.refreshCart();
                                          },
                                          count:
                                              '${controller.data[index].countProducts}',
                                          onTapAdd: () async {
                                            await controller.addToCart(
                                                '${controller.data[index].productId}');
                                            controller.refreshCart();
                                          },
                                          onTapRemove: () async {
                                            await controller.removeFromCart(
                                                '${controller.data[index].productId}');
                                            controller.refreshCart();
                                          },
                                          productStock: controller
                                              .data[index].productStock!,
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  sizeVertical(height42 * 1.2),
                  BottomWidgetExternal(
                    price: "${controller.orderPrice} DH",
                    shipping: "${controller.discountCoupon}%",
                    totalPrice: "${controller.totalPrice()} DH",
                    couponController: controller.couponController,
                    onTapCoupon: () {
                      controller.checkCoupon();
                    },
                    onTap: () {
                      controller.goToCheckout();
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
