import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  const TextApp({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign, this.decoration, this.decorationColor, this.decorationThickness});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
          decorationColor: decorationColor,
          decorationThickness: decorationThickness,
          fontFamily: "Nunito",
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color
      ),);
  }
}
