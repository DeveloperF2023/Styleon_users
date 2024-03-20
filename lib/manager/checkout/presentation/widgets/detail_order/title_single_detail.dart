import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class TitleOfSingleDetail extends StatelessWidget {
  const TitleOfSingleDetail({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width10),
      child: TextApp(
        text: title,
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
        fontSize: font18,
      ),
    );
  }
}
