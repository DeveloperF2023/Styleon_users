import 'package:flutter/material.dart';
import 'package:shop/manager/checkout/presentation/widgets/detail_order/title_single_detail.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget(
      {super.key, required this.title, required this.totalPrice});
  final String title;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10, vertical: height10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: screenHeight * .05,
                    width: screenWidth * .26,
                    child: TitleOfSingleDetail(title: title)),
                sizeHorizontal(width15),
                Padding(
                  padding: EdgeInsets.only(right: width5),
                  child: TextApp(
                    text: totalPrice,
                    fontSize: font20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
