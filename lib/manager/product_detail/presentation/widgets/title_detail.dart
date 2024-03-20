import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class TitleOfEachSectionInDetail extends StatelessWidget {
  const TitleOfEachSectionInDetail(
      {super.key, required this.text, this.isTitle = false, this.onTap});
  final String text;
  final bool? isTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return isTitle == false
        ? Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(
                    text: text,
                    color: AppColors.textColor,
                    fontSize: font18,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: TextApp(
                      text: "SEE ALL",
                      color: AppColors.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          )
        : Container(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width10, vertical: height10),
              child: Row(
                children: [
                  TextApp(
                    text: text,
                    fontSize: font22,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          );
  }
}
