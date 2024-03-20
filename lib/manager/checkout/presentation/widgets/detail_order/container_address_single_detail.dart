import 'package:flutter/material.dart';
import 'package:shop/manager/checkout/presentation/widgets/detail_order/title_single_detail.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/dimensions.dart';
import 'address_single_detail.dart';

class ContainerOfAddressSingleDetail extends StatelessWidget {
  const ContainerOfAddressSingleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10, vertical: height20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: screenHeight * .05,
                width: screenWidth * .26,
                child: const TitleOfSingleDetail(title: "SHIP TO")),
            sizeHorizontal(width15),
            SizedBox(
              width: screenWidth * .48,
              child: const AddressOfSingleDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
