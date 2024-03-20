import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';

class ButtonToChooseLanguage extends StatelessWidget {
  const ButtonToChooseLanguage(
      {super.key,
      required this.imagePath,
      required this.textButton,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed});
  final String imagePath;
  final String textButton;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: screenHeight * .07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: height42,
              width: width42,
            ),
            sizeHorizontal(width10),
            Text(
              textButton,
              style: GoogleFonts.poppins(
                  fontSize: font18,
                  color: textColor,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
