import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class DiscountContainerWidget extends StatelessWidget {
  final String title;
  final String body;
  const DiscountContainerWidget(
      {super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: screenHeight * .22,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/discount.jpg")),
                borderRadius: BorderRadius.circular(radius10)),
          ),
        ),
        Positioned(
            top: height20,
            left: width42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: title,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 35,
                ),
                Row(
                  children: [
                    //TextApp(text: "CASHBACK TO ",color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35,),
                    Text(
                      body,
                      style: TextStyle(
                        fontFamily: "DancingScript",
                        fontSize: font25 * 1.2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                TextApp(
                  text: "50%",
                  color: AppColors.starColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ],
            ))
      ],
    );
  }
}
