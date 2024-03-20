import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/manager/global/form_container.dart';

class HeaderOffers extends StatelessWidget {
  const HeaderOffers(
      {super.key,
      this.onPressedFavorite,
      this.onPressedSearch,
      this.onChanged,
      this.controller,
      this.isFavorite = true});
  final Function()? onPressedFavorite;
  final Function()? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height10),
      child: SizedBox(
        height: screenHeight * .06,
        child: Row(
          children: [
            Expanded(
                child: FormContainer(
              onChanged: onChanged,
              controller: controller,
              hintText: "Search product",
              isFilled: true,
              isPrefix: false,
              fillColor: Colors.grey[100],
              onSearch: onPressedSearch,
            )),
            sizeHorizontal(10),
            isFavorite == true
                ? GestureDetector(
                    onTap: onPressedFavorite,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .13,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          EneftyIcons.heart_outline,
                          color: Colors.grey[500]!,
                          size: 21,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
