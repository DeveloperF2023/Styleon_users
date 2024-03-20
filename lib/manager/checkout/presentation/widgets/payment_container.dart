import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/image_assets.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../../../core/constants/colors.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer(
      {super.key,
      required this.icon,
      required this.isActive,
      this.onChoosePaymentMethod,
      required this.isCreditCard});
  final IconData icon;
  final bool isActive;
  final void Function()? onChoosePaymentMethod;
  final bool isCreditCard;
  @override
  Widget build(BuildContext context) {
    return isCreditCard == true
        ? InkWell(
            onTap: onChoosePaymentMethod,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: isActive == true
                          ? Colors.grey.shade600
                          : AppColors.white,
                      width: isActive != true ? 1.2 : 2)),
              child: const CreditCardUi(
                cardHolderFullName: 'John Doe',
                cardNumber: '1234567812345678',
                validFrom: '01/23',
                validThru: '01/28',
                topLeftColor: Colors.blue,
              ),
            ),
          )
        : InkWell(
            onTap: onChoosePaymentMethod,
            child: Container(
              height: screenHeight * .215,
              width: screenWidth * .7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius10),
                  border: Border.all(
                      color: isActive == true
                          ? Colors.grey.shade600
                          : AppColors.white,
                      width: isActive != true ? 1.2 : 2),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.receive))),
            ),
          );
  }
}
