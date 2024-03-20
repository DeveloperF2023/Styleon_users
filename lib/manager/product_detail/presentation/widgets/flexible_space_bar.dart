import 'package:flutter/material.dart';

class FlexibleSpaceBarWidget extends StatelessWidget {
  const FlexibleSpaceBarWidget({super.key, required this.tag, required this.imageUrl});
  final Object tag;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Hero(
        tag: tag,
        child: Image.network(
          imageUrl,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
