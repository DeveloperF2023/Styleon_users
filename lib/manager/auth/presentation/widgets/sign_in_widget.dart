import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/validator_input.dart';
import '../../../../core/localization/change_local.dart';
import '../../../global/form_container.dart';
import '../../../global/text_app.dart';
import 'button_widget.dart';

class SignInWidget extends GetView<LocaleController> {
  const SignInWidget(
      {super.key,
      required this.emailController,
      required this.passwordController,
      this.onPressedPassword,
      this.onTap,
      required this.formKey});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function()? onPressedPassword;
  final Function()? onTap;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextApp(
          text: "2".tr,
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        sizeVertical(5),
        TextApp(
          text: "11".tr,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        sizeVertical(15),
        Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormContainer(
                  hintText: "32".tr,
                  prefixIcon: EneftyIcons.message_2_outline,
                  controller: emailController,
                  validator: (val) {
                    return validateInput(val!, 5, 100, "email");
                  },
                  isPrefix: true,
                  isSuffix: false,
                ),
                sizeVertical(10),
                FormContainer(
                  hintText: "33".tr,
                  prefixIcon: EneftyIcons.lock_outline,
                  controller: passwordController,
                  isPasswordField: true,
                  validator: (val) {
                    return validateInput(val!, 5, 16, "password");
                  },
                  isSuffix: true,
                  suffixIcon: Icons.visibility_off,
                ),
                sizeVertical(10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: onPressedPassword,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextApp(
                          text: "21".tr,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitleColor,
                        ),
                      ],
                    ),
                  ),
                ),
                sizeVertical(30),
                ButtonWidget(
                  text: "20".tr,
                  onTap: onTap,
                ),
              ],
            ))
      ],
    );
  }
}
