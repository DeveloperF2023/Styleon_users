import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/text_app.dart';

class TitleOfSectionWidget extends StatelessWidget {
  const TitleOfSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height20),
      child: Row(
        children: [
          TextApp(
            text: "Personal Information",
            fontSize: font22,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
