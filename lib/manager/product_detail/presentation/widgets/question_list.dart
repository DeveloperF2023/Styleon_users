import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';
import 'package:shop/manager/product_detail/presentation/widgets/question_list_content.dart';

import '../../../../model/question_model.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailControllerImpl());
    return GetBuilder<ProductDetailControllerImpl>(builder: (controller) {
      return Container(
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.question.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return QuestionListContent(
                  questionModel:
                      QuestionModel.fromJson(controller.question[index]));
            }),
      );
    });
  }
}
