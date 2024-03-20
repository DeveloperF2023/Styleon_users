import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/notification_model.dart';
import '../../../global/text_app.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: height42, left: width20, right: width20),
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
                color: AppColors.notificationColor,
                borderRadius: BorderRadius.circular(radius10)),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width20, vertical: height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: DateFormat("dd-MM-yyyy").format(DateTime.parse(
                        "${notificationModel.notificationDate}")),
                    fontSize: font12,
                    fontWeight: FontWeight.w700,
                  ),
                  TextApp(
                    text: notificationModel.notificationTitle!,
                    fontSize: font16,
                    fontWeight: FontWeight.w700,
                  ),
                  TextApp(
                    text: notificationModel.notificationBody!,
                    fontSize: font14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: height20,
            right: width42 * 1.2,
            child: Container(
              alignment: Alignment.center,
              height: height42,
              width: width42,
              decoration: BoxDecoration(
                  color: AppColors.backGreyColor, shape: BoxShape.circle),
              child: Container(
                height: height32,
                width: width32,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    EneftyIcons.notification_outline,
                    size: font16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
