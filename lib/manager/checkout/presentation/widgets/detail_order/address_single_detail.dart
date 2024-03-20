import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';
import '../../../controller/detail_order/detail_order_controller.dart';

class AddressOfSingleDetail extends StatelessWidget {
  const AddressOfSingleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailOrderControllerImpl());
    return GetBuilder<DetailOrderControllerImpl>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.addressID == "${controller.data[index].addressId}"
                    ? TextApp(
                        text: "${controller.addressName}",
                        color: AppColors.textColor,
                        fontSize: font16,
                        fontWeight: FontWeight.w600,
                      )
                    : TextApp(
                        text: "${controller.addressName}",
                        color: AppColors.textColor,
                      ),
                sizeVertical(height5),
                TextApp(
                  text: "${controller.data[index].addressStreet}",
                  fontSize: font13,
                  color: Colors.black38,
                ),
                const Icon(EneftyIcons.arrow_right_2_bold)
              ],
            );
          });
    });
  }
}
