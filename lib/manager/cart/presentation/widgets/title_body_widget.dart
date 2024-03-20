import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class TitleBodyWidget extends StatelessWidget {
  const TitleBodyWidget({super.key, required this.totalProducts});
  final String totalProducts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: TextApp(
        text: 'Products $totalProducts',
        fontSize: font22,
        color: AppColors.textColor,
      ),
    );
  }
}
