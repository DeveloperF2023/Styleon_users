import 'package:flutter/material.dart';

import '../../core/constants/dimensions.dart';



class IconApp extends StatelessWidget {
  const IconApp({super.key, required this.icon, this.size = 0, this.backgroundColor = Colors.white, this.iconColor, this.onTap});
  final IconData icon;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height32,
        width: width32,
        decoration:  BoxDecoration(
            color: backgroundColor, shape: BoxShape.circle),
        child:  Center(
          child: Icon(
            icon,
            size: size == 0?font18 :size,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}