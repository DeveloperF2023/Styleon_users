import 'package:get/get.dart';
import 'package:shop/core/class/crud.dart';

import 'manager/auth/controller/auth/sign_in_controller.dart';
import 'manager/auth/controller/auth/sign_up_controller.dart';
import 'manager/auth/presentation/pages/verify_code/verify_code_signup.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
    Get.lazyPut(() => LoginControllerImpl(), fenix: true);
    Get.lazyPut(() => const VerifyCodeSignUpPage(), fenix: true);
    Get.lazyPut(() => CRUD(), fenix: true);
  }
}
