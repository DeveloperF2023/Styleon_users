import 'package:flutter/material.dart';
import 'package:shop/manager/checkout/presentation/widgets/detail_order/title_single_detail.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class ContainerOfSingleOrder extends StatelessWidget {
  const ContainerOfSingleOrder({
    super.key,
    required this.title,
    required this.orderName,
    required this.orderDescription,
  });
  final String title;
  final String orderName;
  final String orderDescription;

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
              children: [
                Container(
                    height: screenHeight * .05,
                    width: screenWidth * .26,
                    child: TitleOfSingleDetail(title: title)),
                sizeHorizontal(width15),
                Padding(
                  padding: EdgeInsets.only(right: width5),
                  child: Container(
                    width: screenWidth * .35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextApp(
                          text: orderName,
                          color: AppColors.textColor,
                          fontSize: font16,
                          fontWeight: FontWeight.w600,
                        ),
                        sizeVertical(height5),
                        TextApp(
                          text: orderDescription,
                          fontSize: font13,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
                sizeHorizontal(width42 * 2.2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
