import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key, required this.imageUrl, required this.productDiscount});
  final String imageUrl;
  final String productDiscount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * .14,
          width: screenWidth * .28,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        Positioned(
            top: height10,
            left: width10,
            child: Container(
              height: height20,
              width: screenWidth * .1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius5),
                  color: Color(0xffD4AC0D)),
              child: Center(
                  child: TextApp(
                text: productDiscount,
                fontSize: 10,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              )),
            ))
      ],
    );
  }
}
