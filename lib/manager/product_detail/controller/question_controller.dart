import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/manager/global/controller/search_controller.dart';
import 'package:shop/manager/product_detail/data/fetch_question_remote_datasource.dart';

import '../../../core/constants/routes.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../model/question_model.dart';

abstract class QuestionController extends SearchMixController {
  fetchAllQuestion();
  goToNotification();
}

class QuestionControllerImpl extends QuestionController {
  List<QuestionModel> allQuestion = [];
  QuestionModel? questionModel;
  FetchQuestionRemoteDataSource fetchQuestionRemoteDataSource =
      FetchQuestionRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  fetchAllQuestion() async {
    allQuestion.clear();
    statusRequest = StatusRequest.loading;
    var response = await fetchQuestionRemoteDataSource.fetchQuestion();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        allQuestion.addAll(responseData.map((e) => QuestionModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    fetchAllQuestion();
    super.onInit();
  }

  @override
  goToNotification() {
    Get.toNamed(AppRoutes.notification);
  }
}
