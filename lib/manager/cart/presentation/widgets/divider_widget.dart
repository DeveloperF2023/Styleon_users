import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.subtitleColor!.withOpacity(0.2),
      thickness: 1.2,
    );
  }
}
