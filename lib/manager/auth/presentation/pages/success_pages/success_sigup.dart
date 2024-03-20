import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../global/text_app.dart';
import '../../widgets/button_widget.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/success.json", height: 300, width: 300),
          sizeVertical(20),
          const TextApp(
            text: "Congratulations\n Successfully Registration",
            fontSize: 25,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          sizeVertical(20),
          ButtonWidget(
            text: "Login Page",
            onTap: () => Get.toNamed(AppRoutes.login),
          ),
        ],
      )),
    );
  }
}
