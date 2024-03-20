import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';

import '../../../../../core/enum/status_request.dart';
import '../../../../../core/functions/handling_data.dart';
import '../../../data/forget/reset_password_remote_datasource.dart';

abstract class ResetPasswordController extends GetxController {
  goToVerifyCode();
  goToSuccessReset();
  resetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  GlobalKey<FormState> formKeyReset = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordRemoteDataSource resetPasswordRemoteDataSource =
      ResetPasswordRemoteDataSource(Get.find());
  String? email;
  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoutes.verifyCode, arguments: {"email": email!});
  }

  @override
  resetPassword() async {
    if (passwordController.text != confirmPasswordController.text)
      return Get.defaultDialog(
          title: "Error", middleText: "The password does not match");
    if (formKeyReset.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordRemoteDataSource.postData(
          email!, passwordController.text);
      statusRequest = handlingData(response);
      print(
          "-------------------------------- Controller $response---------------");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "PLease try again...");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print("valid");
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  goToSuccessReset() {
    Get.toNamed(AppRoutes.successResetPassword);
  }
}
