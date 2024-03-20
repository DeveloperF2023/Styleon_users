import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';

class ColorsList extends GetView<ProductDetailControllerImpl> {
  const ColorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: "Colors:",
            fontWeight: FontWeight.w700,
            color: AppColors.textColor,
            fontSize: font18,
          ),
          sizeVertical(height10),
          Row(
            children: [
              ...List.generate(
                controller.subitems.length,
                (index) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: controller.subitems[index]['active'] == "1"
                          ? AppColors.textColor
                          : Colors.white,
                      border: Border.all(color: AppColors.textColor!),
                      borderRadius: BorderRadius.circular(radius10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width20, vertical: height10),
                    child: Text(controller.subitems[index]['name'],
                        style: TextStyle(
                            color: controller.subitems[index]['active'] == "1"
                                ? Colors.white
                                : AppColors.textColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
