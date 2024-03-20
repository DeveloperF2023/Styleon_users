import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class UsernameSubstringWidget extends StatelessWidget {
  const UsernameSubstringWidget(
      {super.key,
      required this.username,
      this.height = 42,
      this.width = 42,
      this.size = 18});
  final String username;
  final double? height;
  final double? width;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor, shape: BoxShape.circle),
      child: Center(
          child: TextApp(
        text: username,
        fontSize: size,
        color: AppColors.white,
      )),
    );
  }
}
