import 'package:flutter/material.dart';
import 'package:shop/manager/global/text_app.dart';

import '../../core/constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.automaticallyImplyLeading,
    this.onPressed,
    this.bottom,
    this.kToolbarHeight = 50,
  });
  final String title;
  final bool automaticallyImplyLeading;
  final Function()? onPressed;
  final PreferredSizeWidget? bottom;
  final double? kToolbarHeight;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading == true
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 18,
              ))
          : null,
      title: TextApp(
        text: title,
        fontWeight: FontWeight.w700,
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight!);
}
