import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width42 * 1.5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(radius5)),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width10, vertical: height10),
              child: TextApp(
                text: "Continue",
                fontSize: font16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
