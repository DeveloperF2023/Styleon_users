import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/constants/routes.dart';
import '../../../../core/enum/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../data/sign_up_remote_datasource.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSuccessSignUp();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  GlobalKey<FormState> formKeySignUp =
      GlobalKey<FormState>(debugLabel: "signup");
  SignUpRemoteDataSource signUpRemoteDataSource =
      SignUpRemoteDataSource(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  signUp() async {
    var formData = formKeySignUp.currentState!.validate();
    if (formData) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpRemoteDataSource.postData(nameController.text,
          emailController.text, passwordController.text, phoneController.text);
      statusRequest = handlingData(response);
      print(
          "------------------------------------------------------------------------ Controller $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifyCodeSignUp,
              arguments: {"email": emailController.text});
        } else {
          Get.defaultDialog(
              title: "warning",
              middleText: "phone number or email is already exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoutes.successSignUp);
  }
}
