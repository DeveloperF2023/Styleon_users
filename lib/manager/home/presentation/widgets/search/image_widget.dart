import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .13,
      width: screenWidth * .24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius5),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
