import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';

import 'form_container_home.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      this.onPressedFavorite,
      this.onPressedSearch,
      this.onChanged,
      this.controller,
      this.isFavorite = true,
      this.onNotification,
      this.isLeading = false,
      this.hintText = "Search Products"});
  final Function()? onPressedFavorite;
  final Function()? onPressedSearch;
  final Function(String)? onChanged;
  final void Function()? onNotification;
  final TextEditingController? controller;
  final bool? isFavorite;
  final bool? isLeading;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return isLeading == true
        ? Padding(
            padding:
                EdgeInsets.symmetric(vertical: height10, horizontal: width10),
            child: SizedBox(
              height: screenHeight * .06,
              child: Row(
                children: [
                  SizedBox(
                      width: 45,
                      child: Center(
                          child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.arrow_back)))),
                  Expanded(
                      child: FormContainerHome(
                    onChanged: onChanged,
                    controller: controller,
                    hintText: "54".tr,
                    isFilled: true,
                    isPrefix: false,
                    fillColor: Colors.grey[100],
                    onSearch: onPressedSearch,
                  )),
                  sizeHorizontal(width10),
                  GestureDetector(
                    onTap: onNotification,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .13,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          EneftyIcons.notification_outline,
                          color: Colors.grey[500]!,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
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
          )
        : Padding(
            padding:
                EdgeInsets.symmetric(vertical: height10, horizontal: width10),
            child: SizedBox(
              height: screenHeight * .06,
              child: Row(
                children: [
                  Expanded(
                      child: FormContainerHome(
                    onChanged: onChanged,
                    controller: controller,
                    hintText: hintText,
                    isFilled: true,
                    isPrefix: false,
                    fillColor: Colors.grey[100],
                    onSearch: onPressedSearch,
                  )),
                  sizeHorizontal(width10),
                  GestureDetector(
                    onTap: onNotification,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .13,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          EneftyIcons.notification_outline,
                          color: Colors.grey[500]!,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
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
