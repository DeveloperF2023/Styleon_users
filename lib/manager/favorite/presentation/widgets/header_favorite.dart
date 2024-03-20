import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class HeaderOfFavorite extends StatelessWidget {
  final void Function()? onFavorite;
  final String username;
  const HeaderOfFavorite({super.key, this.onFavorite, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .08,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                      text: "Favorites",
                      fontSize: font25,
                      color: AppColors.textColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
