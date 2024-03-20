import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../global/text_app.dart';

class RatingContentWidgetForSearch extends StatelessWidget {
  const RatingContentWidgetForSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          EneftyIcons.star_bold,
          color: Color(0xffF1C40F),
          size: font18,
        ),
        sizeHorizontal(5),
        TextApp(
          text: "4.8 | ",
          fontWeight: FontWeight.w600,
          fontSize: font14,
          color: AppColors.textColor,
        ),
        Container(
            height: 20,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: TextApp(
              text: "300 reviews",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.textColor,
            ))),
      ],
    );
  }
}
