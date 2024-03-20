import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class SingleOrderDetail extends StatelessWidget {
  const SingleOrderDetail(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: title,
            fontSize: font16,
            color: AppColors.textColor!.withOpacity(0.7),
          ),
          TextApp(
            text: description,
            fontSize: font16,
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
