import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/localization/change_local.dart';
import '../../../../global/text_app.dart';
import '../../../controller/auth/forget/verify_code_controller.dart';
import '../../widgets/background_image.dart';

class VerifyCodePage extends GetView<LocaleController> {
  const VerifyCodePage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImpl());
    return Scaffold(
        body: GetBuilder<VerifyCodeControllerImpl>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
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
                                  controller.goToForgetPassword();
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
                              text: '28'.tr,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            sizeVertical(5),
                            TextApp(
                              text: '29'.tr,
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
                                controller.goToResetPassword(verificationCode);
                              }, // end onSubmit
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ));
    }));
  }
}
