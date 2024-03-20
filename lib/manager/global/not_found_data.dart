import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/manager/global/text_app.dart';

import '../../core/constants/dimensions.dart';

class NotFoundData extends StatelessWidget {
  final String text;
  const NotFoundData({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .9,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/not_found.json", height: 100),
          sizeVertical(height10),
          TextApp(
            text: "😞 $text\n please retry again",
            fontSize: font16,
            color: AppColors.grey600,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
