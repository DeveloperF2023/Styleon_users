import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/manager/notification/controller/notification_controller.dart';

import '../../../global/app_bar.dart';
import '../widgets/notification_section.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImpl());
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Notification',
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.backGreyColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<NotificationControllerImpl>(builder: (controller) {
              return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NotificationSection(
                          notificationModel: controller.data[index],
                        );
                      }));
            })
          ],
        ),
      )),
    );
  }
}
