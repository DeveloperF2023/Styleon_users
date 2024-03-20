import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/enum/status_request.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/localization/change_local.dart';
import '../../../../global/text_app.dart';
import '../../../controller/auth/verify_code_signup.dart';
import '../../widgets/background_image.dart';

class VerifyCodeSignUpPage extends GetView<LocaleController> {
  const VerifyCodeSignUpPage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return controller.statusRequest == StatusRequest.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  const BackgroundImage(),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height * .15,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      controller.goToSignUp();
                                    },
                                    child: Container(
                                        height: 38,
                                        width: 38,
                                        decoration: BoxDecoration(
                                            color: Colors.white30,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 20,
                                        )))),
                                sizeVertical(5),
                                TextApp(
                                  text: '20'.tr,
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                sizeVertical(5),
                                TextApp(
                                  text:
                                      "Veuillez saisir votre code numérique envoyé à ${controller.email}",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                                sizeVertical(15),
                                OtpTextField(
                                  numberOfFields: 5,
                                  fieldWidth: 50,
                                  borderColor: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  showFieldAsBox: true,
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                  //runs when every textfield is filled
                                  onSubmit: (String verificationCode) {
                                    controller
                                        .goToSuccessSignUp(verificationCode);
                                  }, // end onSubmit
                                ),
                                sizeVertical(height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextApp(
                                      text: "You have not received a code?",
                                      color: Colors.white,
                                      fontSize: font16,
                                    ),
                                    sizeHorizontal(width5),
                                    InkWell(
                                        onTap: () {
                                          controller.resendCode();
                                        },
                                        child: TextApp(
                                          text: "Resend",
                                          color: AppColors.primaryColor,
                                          fontSize: font18,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              );
      }),
    );
  }
}
