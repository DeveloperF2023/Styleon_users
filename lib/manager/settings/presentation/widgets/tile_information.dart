import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class TileInformationWidget extends StatelessWidget {
  const TileInformationWidget(
      {super.key,
      required this.text,
      required this.icon,
      this.onTap,
      this.isSwitch = false});
  final String text;
  final IconData icon;
  final Function()? onTap;
  final bool? isSwitch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.grey600,
              ),
              sizeHorizontal(20),
              TextApp(
                text: text,
                fontSize: 18,
                color: AppColors.grey600,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          GestureDetector(
              onTap: onTap,
              child: isSwitch == false
                  ? Icon(
                      EneftyIcons.arrow_right_3_outline,
                      size: 20,
                      color: AppColors.grey600,
                    )
                  : Container(
                      height: height10,
                      child: Switch(value: true, onChanged: (val) {})))
        ],
      ),
    );
  }
}
