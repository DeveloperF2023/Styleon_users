import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../model/question_model.dart';
import '../../../../global/text_app.dart';

class ListOfAllQuestion extends StatelessWidget {
  const ListOfAllQuestion({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height3),
                  child: Icon(
                    EneftyIcons.message_question_outline,
                    color: AppColors.grey600,
                    size: font25,
                  ),
                ),
                sizeHorizontal(width10),
                Expanded(
                    child: TextApp(
                        text: questionModel.questionTitle!,
                        fontSize: font18,
                        color: AppColors.textColor!.withOpacity(0.9),
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width10, vertical: height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  EneftyIcons.strongbox_2_outline,
                  color: AppColors.subtitleColor,
                  size: font25,
                ),
                sizeHorizontal(width10),
                Expanded(
                    child: TextApp(
                  text: questionModel.questionDesc!,
                  fontSize: font14,
                  color: AppColors.textColor!.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
