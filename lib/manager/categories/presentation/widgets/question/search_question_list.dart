import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/enum/status_request.dart';
import '../../../../../model/question_model.dart';
import '../../../../global/text_app.dart';
import '../../../../home/presentation/widgets/search/not_found_widget.dart';
import '../../../../product_detail/controller/question_controller.dart';

class ListOfSearchQuestion extends GetView<QuestionControllerImpl> {
  const ListOfSearchQuestion({super.key, required this.searchList});
  final List<QuestionModel> searchList;
  @override
  Widget build(BuildContext context) {
    Get.put(QuestionControllerImpl());
    return controller.statusRequest == StatusRequest.failure
        ? NotFoundWidget()
        : ListView.builder(
            itemCount: searchList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
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
                                text: searchList[index].questionTitle!,
                                fontSize: 18,
                                color: AppColors.textColor!.withOpacity(0.9),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                          text: searchList[index].questionDesc!,
                          fontSize: 14,
                          color: AppColors.textColor!.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ))
                      ],
                    ),
                  ),
                ],
              );
            });
  }
}
