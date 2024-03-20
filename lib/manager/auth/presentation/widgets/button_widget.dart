import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .055,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextApp(
              text: text,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
