import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/colors.dart';

import '../../../../../core/constants/routes.dart';
import '../../../../categories/presentation/widgets/question/allquestion_list.dart';
import '../../../../categories/presentation/widgets/question/search_question_list.dart';
import '../../../../global/app_bar.dart';
import '../../../../home/presentation/widgets/header_widget.dart';
import '../../../controller/question_controller.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionControllerImpl());
    return GetBuilder<QuestionControllerImpl>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBarWidget(
              title: "Questions",
              automaticallyImplyLeading: true,
              onPressed: () {
                Get.back();
              },
            ),
            body: SafeArea(
                child: Column(
              children: [
                HeaderWidget(
                  onPressedFavorite: () {
                    Get.toNamed(AppRoutes.favoritePage);
                  },
                  onChanged: (value) {
                    controller.checkValue(value);
                  },
                  controller: controller.searchController,
                  onPressedSearch: () {
                    controller.onSearchQuestion();
                  },
                  onNotification: () {
                    controller.goToNotification();
                  },
                ),
                !controller.isSearch
                    ? Flexible(
                        child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 5,
                                      color: AppColors.subtitleColor!
                                          .withOpacity(0.5),
                                    );
                                  },
                                  itemCount: controller.allQuestion.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListOfAllQuestion(
                                      questionModel:
                                          controller.allQuestion[index],
                                    );
                                  });
                            }),
                      )
                    : ListOfSearchQuestion(
                        searchList: controller.searchQuestion)
              ],
            )),
          ));
    });
  }
}
