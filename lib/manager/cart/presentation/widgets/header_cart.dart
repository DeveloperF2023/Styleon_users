import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class HeaderCartWidget extends StatelessWidget {
  const HeaderCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10, vertical: height20),
        child: Row(
          children: [
            TextApp(
              text: "Cart",
              fontWeight: FontWeight.w500,
              fontSize: font20,
              color: AppColors.textColor,
            )
          ],
        ),
      ),
    );
  }
}
