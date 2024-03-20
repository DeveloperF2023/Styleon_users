import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class TotalPriceOfOrderDetail extends StatelessWidget {
  const TotalPriceOfOrderDetail(
      {super.key, required this.totalPrice, required this.title});
  final String totalPrice;
  final String title;
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
            text: totalPrice,
            fontSize: font16,
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
