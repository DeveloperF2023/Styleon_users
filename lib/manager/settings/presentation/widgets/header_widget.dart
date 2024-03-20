import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class HeaderSettingsWidget extends StatelessWidget {
  const HeaderSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10, vertical: height20),
        child: Row(
          children: [
            Container(
                height: height20 * 1.2,
                width: width20 * 1.2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!, width: 1.5),
                    shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: font16,
                    color: Colors.grey[500],
                  ),
                )),
            sizeHorizontal(width42 * 3),
            TextApp(
              text: "Settings",
              color: Colors.grey[500],
              fontSize: font20,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
