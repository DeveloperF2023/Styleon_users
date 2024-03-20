import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_constants.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class DeliveryContainer extends StatelessWidget {
  const DeliveryContainer(
      {super.key,
      required this.icon,
      required this.typeOfDelivery,
      required this.timeOfDelivery,
      required this.isActive,
      this.onChooseTypeOfDelivery});
  final IconData icon;
  final bool isActive;
  final String typeOfDelivery;
  final String timeOfDelivery;
  final void Function()? onChooseTypeOfDelivery;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChooseTypeOfDelivery,
      child: Container(
        height: screenHeight * .1,
        width: screenWidth,
        decoration: BoxDecoration(
            border: Border.all(
                color: isActive == true
                    ? AppColors.textColor!
                    : AppColors.subtitleColor!,
                width: isActive == true ? 1.8 : 1.2),
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width10, vertical: height10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.textColor,
                size: font25 * 1.7,
              ),
              sizeHorizontal(width10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextApp(
                    text: typeOfDelivery,
                    fontSize: font16,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w800,
                  ),
                  sizeVertical(height5),
                  TextApp(
                    text: timeOfDelivery,
                    fontSize: font14,
                    color: AppColors.textColor!.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
