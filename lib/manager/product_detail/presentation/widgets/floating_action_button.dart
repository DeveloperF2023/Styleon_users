import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget(
      {super.key,
      required this.onTapAddToCart,
      this.countCart,
      required this.onTapCart,
      required this.onTapRemoveFromCart});
  final Function() onTapCart;
  final Function() onTapAddToCart;
  final Function() onTapRemoveFromCart;
  final int? countCart;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F4),
        border: Border(
          top: BorderSide(
              width: 0.5, color: AppColors.backGreyColor.withOpacity(0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: height42,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: onTapRemoveFromCart, child: Icon(Icons.remove)),
                  sizeHorizontal(width10),
                  TextApp(
                    text: '${countCart}',
                    fontSize: font25,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  sizeHorizontal(width10),
                  GestureDetector(
                      onTap: onTapAddToCart, child: Icon(Icons.add)),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapCart,
            child: Container(
              height: MediaQuery.of(context).size.height * .055,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width42),
                child: TextApp(
                  text: "Checkout",
                  fontWeight: FontWeight.w500,
                  fontSize: font20,
                  color: AppColors.backgroundColor,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
