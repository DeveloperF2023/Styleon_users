import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key, required this.onAddNewAddress});
  final void Function() onAddNewAddress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: "ADDRESS",
          color: AppColors.textColor,
          fontSize: font18,
        ),
        GestureDetector(
          onTap: onAddNewAddress,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius5),
                  color: AppColors.primaryColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width10, vertical: height5),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: font18,
                      color: AppColors.white,
                    ),
                    TextApp(
                      text: "Add New",
                      color: AppColors.white,
                      fontSize: font14,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
