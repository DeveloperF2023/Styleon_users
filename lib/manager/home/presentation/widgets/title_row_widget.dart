import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget(
      {super.key,
      required this.text,
      this.onPressed,
      this.isShowSeeAll = true});
  final String text;
  final Function()? onPressed;
  final bool? isShowSeeAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: text,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          isShowSeeAll == true
              ? TextButton(
                  onPressed: onPressed,
                  child: TextApp(
                    text: "47".tr,
                    color: AppColors.primaryColor,
                    fontSize: font16,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ))
              : Container()
        ],
      ),
    );
  }
}
