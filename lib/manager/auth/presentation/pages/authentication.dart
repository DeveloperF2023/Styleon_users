import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/functions/alert_exit_app.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/text_app.dart';
import '../../controller/auth/sign_in_controller.dart';
import '../../controller/auth/sign_up_controller.dart';
import '../widgets/background_image.dart';
import '../widgets/sign_in_widget.dart';
import '../widgets/sign_up_widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImpl());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Stack(
          children: [
            const BackgroundImage(),
            Positioned(
                bottom: MediaQuery.of(context).size.height * .15,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: screenHeight * .50,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        animationDuration: const Duration(milliseconds: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TabBar(
                                indicatorColor: AppColors.primaryColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                padding: EdgeInsets.zero,
                                indicatorPadding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.zero,
                                tabs: [
                                  Tab(
                                    child: TextApp(
                                      text: "44".tr,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Tab(
                                    child: TextApp(
                                      text: "45".tr,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ]),
                            Expanded(
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GetBuilder<LoginControllerImpl>(
                                        builder: (controller) {
                                      return controller.statusRequest ==
                                              StatusRequest.loading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : SignInWidget(
                                              formKey: controller.formLogin,
                                              emailController:
                                                  controller.emailController,
                                              passwordController:
                                                  controller.passwordController,
                                              onPressedPassword: () {
                                                controller.goToForgetPassword();
                                              },
                                              onTap: () {
                                                controller.login();
                                              },
                                            );
                                    }),
                                    GetBuilder<SignUpControllerImpl>(
                                        builder: (controller) {
                                      return controller.statusRequest ==
                                              StatusRequest.loading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : SignUpWidget(
                                              formKey: controller.formKeySignUp,
                                              emailController:
                                                  controller.emailController,
                                              passwordController:
                                                  controller.passwordController,
                                              phoneController:
                                                  controller.phoneController,
                                              nameController:
                                                  controller.nameController,
                                              onTap: () {
                                                controller.signUp();
                                              },
                                            );
                                    })
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
