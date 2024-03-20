import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: "Description:",
            fontSize: font18,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ),
          TextApp(
            text: description,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor!.withOpacity(0.8),
            fontSize: font16,
          )
        ],
      ),
    );
  }
}
