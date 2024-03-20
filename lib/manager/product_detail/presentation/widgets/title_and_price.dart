import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class TitleAndPriceWidget extends StatelessWidget {
  const TitleAndPriceWidget(
      {super.key, required this.productName, required this.productPrice});
  final String productName;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * .6,
              child: TextApp(
                text: productName,
                fontWeight: FontWeight.w600,
                fontSize: font22,
                color: AppColors.textColor,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextApp(
                text: productPrice,
                fontWeight: FontWeight.w800,
                fontSize: font20,
                color: AppColors.textColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
