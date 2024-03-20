import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../global/text_app.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width20),
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
                text: "Add",
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
