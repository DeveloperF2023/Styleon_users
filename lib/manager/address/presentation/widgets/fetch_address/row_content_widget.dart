import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_constants.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class CardContentWidget extends StatelessWidget {
  const CardContentWidget(
      {super.key,
      required this.title,
      required this.city,
      required this.phone,
      required this.street,
      required this.onPressed,
      this.isOpen = false,
      this.onOpen,
      this.isSecondOpen});
  final String title;
  final String city;
  final String phone;
  final String street;
  final void Function() onPressed;
  final bool? isOpen;
  final bool? isSecondOpen;
  final void Function()? onOpen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.backGreyColor, width: 2),
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width10, vertical: height10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height42,
                        width: width42,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor.withOpacity(0.2),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.my_location,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      sizeHorizontal(width20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextApp(
                            text: title,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: font16,
                          ),
                          Container(
                              width: screenWidth * .6,
                              child: TextApp(
                                text: street,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: font14,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextApp(
                                text: "Phone: ",
                                color: AppColors.textColor,
                                fontSize: font14,
                                fontWeight: FontWeight.w400,
                              ),
                              TextApp(
                                text: phone,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: font14,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
