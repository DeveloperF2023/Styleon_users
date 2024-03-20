import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';

class AddressOrderDetail extends StatelessWidget {
  const AddressOrderDetail(
      {super.key,
      this.isOpen,
      this.onOpenAddress,
      required this.addressName,
      required this.street});
  final bool? isOpen;
  final void Function()? onOpenAddress;
  final String addressName;
  final String street;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width15, vertical: height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(
                    text: "Address",
                    fontSize: font16,
                    color: AppColors.textColor!.withOpacity(0.7),
                  ),
                  InkWell(
                      onTap: onOpenAddress,
                      child: Icon(
                        isOpen != false
                            ? EneftyIcons.arrow_right_3_outline
                            : EneftyIcons.arrow_down_outline,
                        color: AppColors.subtitleColor,
                        size: font22,
                      )),
                ],
              ),
            ),
            isOpen != true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: addressName,
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      TextApp(
                        text: street,
                        fontSize: font14,
                        color: AppColors.subtitleColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
