import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/routes.dart';
import '../../../../../core/enum/status_request.dart';
import '../../../../../core/functions/handling_data.dart';
import '../../../data/forget/check_email_remote_datasource.dart';

abstract class ForgetPasswordController extends GetxController {
  goToAuth();
  checkEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  TextEditingController? emailController;
  CheckEmailRemoteDataSource checkEmailRemoteDataSource =
      CheckEmailRemoteDataSource(Get.find());
  GlobalKey<FormState> formKeyForget = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController!.dispose();
    super.dispose();
  }

  @override
  checkEmail() async {
    if (formKeyForget.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await checkEmailRemoteDataSource.postData(emailController!.text);
      statusRequest = handlingData(response);
      print(
          "------------------------------------------------------------------------ Controller $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifyCode,
              arguments: {"email": emailController!.text});
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "email does not exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToAuth() {
    Get.toNamed(AppRoutes.login);
  }
}
