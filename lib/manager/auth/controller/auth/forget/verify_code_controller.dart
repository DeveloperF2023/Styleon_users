import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';

import '../../../../../core/enum/status_request.dart';
import '../../../../../core/functions/handling_data.dart';
import '../../../data/forget/verify_code_forget_remote_datasource.dart';

abstract class VerifyCodeController extends GetxController {
  goToForgetPassword();
  goToResetPassword(String verificationCode);
  checkCode();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPasswordRemoteDataSource
      verifyCodeForgetPasswordRemoteDataSource =
      VerifyCodeForgetPasswordRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword, arguments: {"email": email});
  }

  @override
  checkCode() {}

  @override
  goToResetPassword(String verificationCode) async {
    var statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordRemoteDataSource.postData(
        email!, verificationCode);
    statusRequest = handlingData(response);
    print(
        "-------------------------------- Controller $response---------------");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email!});
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verify code not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("valid");
  }
}
