import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class HeaderOfOrderWidget extends StatelessWidget {
  const HeaderOfOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backGreyColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height10),
        child: TextApp(
          text: "Review",
          color: AppColors.textColor,
          fontSize: font18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
