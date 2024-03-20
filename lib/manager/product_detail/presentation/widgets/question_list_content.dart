import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../model/question_model.dart';
import '../../../global/text_app.dart';

class QuestionListContent extends GetView<ProductDetailControllerImpl> {
  const QuestionListContent({super.key, required this.questionModel});
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                EneftyIcons.message_question_outline,
                color: AppColors.subtitleColor,
                size: 25,
              ),
              sizeHorizontal(10),
              Expanded(
                  child: TextApp(
                      text: questionModel.questionTitle!,
                      fontSize: 18,
                      color: AppColors.textColor!.withOpacity(0.9),
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                EneftyIcons.strongbox_2_outline,
                color: AppColors.subtitleColor,
                size: 25,
              ),
              sizeHorizontal(10),
              Expanded(
                  child: TextApp(
                text: questionModel.questionDesc!,
                fontSize: 14,
                color: AppColors.textColor!.withOpacity(0.8),
                fontWeight: FontWeight.w400,
              ))
            ],
          ),
        ),
      ],
    );
  }
}
