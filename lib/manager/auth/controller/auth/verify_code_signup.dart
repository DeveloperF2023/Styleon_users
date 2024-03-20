import 'package:get/get.dart';

import '../../../../core/constants/routes.dart';
import '../../../../core/enum/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../data/resend_code_login_remote_datasource.dart';
import '../../data/veirfy_code_signup_remote_datasource.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  goToSignUp();
  resendCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  VerifyCodeRemoteDataSource verifyCodeRemoteDataSource =
      VerifyCodeRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  ResendVerifyCodeRemoteDataSource resendVerifyCodeRemoteDataSource =
      ResendVerifyCodeRemoteDataSource(Get.find());
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verificationCode) async {
    var statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeRemoteDataSource.postData(verificationCode, email!);
    statusRequest = handlingData(response);
    print(
        "-------------------------------- Controller $response---------------");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verify code not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("valid");
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  resendCode() {
    resendVerifyCodeRemoteDataSource.resendCode(email!);
  }
}
