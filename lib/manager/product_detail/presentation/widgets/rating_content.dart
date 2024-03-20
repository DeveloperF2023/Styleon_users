import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class RatingContentWidget extends StatelessWidget {
  const RatingContentWidget({super.key, required this.productStock});
  final int productStock;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 25,
        width: productStock > 0 ? screenWidth * .28 : screenWidth * .35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius5),
            color: productStock > 0
                ? AppColors.primaryColor.withOpacity(0.2)
                : AppColors.trashColor.withOpacity(0.2)),
        child: productStock > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.bolt,
                    color: Color(0xffF1C40F),
                    size: 18,
                  ),
                  TextApp(
                    text: "Available in stock",
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: AppColors.textColor,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bolt,
                    color: AppColors.textColor,
                    size: 18,
                  ),
                  TextApp(
                    text: "Not available in stock",
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: AppColors.textColor,
                  ),
                ],
              ),
      ),
    );
  }
}
