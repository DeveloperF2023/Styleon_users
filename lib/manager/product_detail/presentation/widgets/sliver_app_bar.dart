import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {super.key,
      this.onTapBack,
      this.onTapFavourite,
      required this.countCart,
      this.onTapCart});
  final Function()? onTapBack;
  final Function()? onTapFavourite;
  final Function()? onTapCart;
  final String countCart;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTapBack,
          child: Container(
            height: 32,
            width: 32,
            decoration: const BoxDecoration(
                color: Colors.white24, shape: BoxShape.circle),
            child: const Center(
              child: Icon(
                EneftyIcons.arrow_left_3_outline,
                size: 17,
              ),
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onTapFavourite,
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    EneftyIcons.heart_outline,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ),
            sizeHorizontal(width5),
            GestureDetector(
              onTap: onTapCart,
              child: Stack(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        EneftyIcons.shopping_bag_outline,
                        size: 17,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: height10 + height5,
                      width: width10 + width5,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: TextApp(
                          text: countCart,
                          fontSize: font12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
