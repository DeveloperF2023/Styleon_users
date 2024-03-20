import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/routes.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/app_bar.dart';
import '../../controller/orders_controller.dart';
import '../widgets/list_order_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImpl());
    return Scaffold(
      appBar: AppBarWidget(
        title: "Orders",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.backGreyColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<OrderControllerImpl>(builder: (controller) {
              return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.orderDetail, arguments: {
                            "orderModel": controller.data[index]
                          });
                        },
                        child: Slidable(
                          startActionPane:
                              controller.data[index].ordersStatus == 0
                                  ? ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.red,
                                          icon: Icons.delete,
                                          onPressed: (BuildContext context) {
                                            controller.deleteOrder(
                                                "${controller.data[index].ordersId}");
                                          },
                                          label: "Remove",
                                        )
                                      ],
                                    )
                                  : null,
                          child: Padding(
                            padding: EdgeInsets.only(top: height5),
                            child: ListOrderWidget(
                              orders: controller.data[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ));
            })
          ],
        ),
      )),
    );
  }
}
