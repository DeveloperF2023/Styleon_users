import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/routes.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/enum/status_request.dart';
import '../../../../global/app_bar.dart';
import '../../../../global/not_found_data.dart';
import '../../../controller/archive_order_controller.dart';
import '../../widgets/archive/list_archive_order.dart';

class ArchiveOrderScreen extends StatelessWidget {
  const ArchiveOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrderControllerImpl());
    return Scaffold(
      appBar: AppBarWidget(
        title: "Archive Orders",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.backGreyColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ArchiveOrderControllerImpl>(builder: (controller) {
              return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: RefreshIndicator(
                    onRefresh: () {
                      return controller.fetchArchiveOrder();
                    },
                    child: controller.statusRequest == StatusRequest.success
                        ? ListView.builder(
                            itemCount: controller.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.orderDetail,
                                      arguments: {
                                        "orderModel": controller.data[index]
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: height5),
                                  child: ListOfArchiveWidget(
                                      orderNumber:
                                          "Order #${controller.data[index].ordersId}",
                                      orderDate:
                                          "Order Type: ${controller.typeOfOrder("${controller.data[index].ordersType}")}",
                                      status:
                                          "Status: ${controller.statusOfOrder("${controller.data[index].ordersStatus}")}",
                                      orderFromNow: Jiffy.parse(controller
                                              .data[index].ordersDate!)
                                          .fromNow(),
                                      orderId:
                                          '${controller.data[index].ordersId}',
                                      orderRating:
                                          controller.data[index].ordersId!),
                                ),
                              );
                            },
                          )
                        : NotFoundData(
                            text: "There is no archive orders",
                          ),
                  ));
            })
          ],
        ),
      )),
    );
  }
}
