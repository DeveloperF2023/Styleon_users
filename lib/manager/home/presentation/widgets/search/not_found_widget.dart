import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/image_assets.dart';

import '../../../../global/text_app.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenHeight * .22,
          width: screenWidth * .45,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(ImageAssets.notFound))),
        ),
        TextApp(text: "Ooops, The products not found 😔")
      ],
    );
  }
}
