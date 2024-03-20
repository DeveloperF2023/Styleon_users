import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width20),
      child: Row(
        children: [
          TextApp(
            text: text,
            color: AppColors.grey600,
          ),
        ],
      ),
    );
  }
}
