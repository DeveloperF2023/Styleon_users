import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.nameOfAddress,
    required this.cityOfAddress,
    required this.streetOfAddress,
    required this.isActive,
    this.onChooseAddress,
    required this.onEditAddress,
  });
  final String nameOfAddress;
  final String cityOfAddress;
  final String streetOfAddress;
  final bool isActive;
  final void Function()? onChooseAddress;
  final void Function() onEditAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onChooseAddress,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height10),
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: isActive != true
                          ? AppColors.subtitleColor!
                          : AppColors.textColor!,
                      width: isActive != true ? 1.2 : 1.8),
                  borderRadius: BorderRadius.circular(radius10)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width10, vertical: height20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp(
                      text: nameOfAddress,
                      fontSize: font16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    sizeVertical(height5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenHeight * .3,
                          child: TextApp(
                            text: "$streetOfAddress $cityOfAddress",
                            fontSize: font14,
                            color: AppColors.textColor!.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
