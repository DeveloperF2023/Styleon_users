import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class TagContainerWidget extends StatelessWidget {
  const TagContainerWidget(
      {super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          fontSize: font16,
          color: AppColors.textColor!.withOpacity(0.8),
          fontWeight: FontWeight.w600,
        ),
        TextApp(
          text: text,
          fontSize: font16,
          color: AppColors.textColor!.withOpacity(0.6),
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
