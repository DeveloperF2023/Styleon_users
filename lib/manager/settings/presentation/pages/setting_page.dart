import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/manager/settings/controller/settings_controller.dart';
import 'package:shop/manager/settings/presentation/widgets/personal_information.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../../global/app_bar.dart';
import '../widgets/tile_information.dart';
import '../widgets/title_section_widget.dart';

class SettingsPage extends GetView<SettingsControllerImpl> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImpl());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Settings",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      body: SafeArea(
          child: Column(
        children: [
          PersonalInformationWidget(
            username: controller.username!,
            email: controller.email!,
            substringUsername: controller.getInitials(
                string: controller.username!, limitTo: 1),
          ),
          const TitleOfSectionWidget(),
          Container(
            width: double.infinity,
            color: AppColors.white,
            child: Column(
              children: [
                TileInformationWidget(
                  text: "Address",
                  icon: EneftyIcons.location_tick_outline,
                  onTap: () {
                    Get.toNamed(AppRoutes.viewAddress);
                  },
                ),
                TileInformationWidget(
                  text: "Orders",
                  icon: EneftyIcons.card_outline,
                  onTap: () => controller.goToOrders(),
                ),
                TileInformationWidget(
                  text: "Archives",
                  icon: EneftyIcons.archive_book_outline,
                  onTap: () => controller.goToArchive(),
                ),
                TileInformationWidget(
                  text: "About us",
                  icon: EneftyIcons.info_circle_outline,
                  onTap: () => Get.toNamed(AppRoutes.aboutUs),
                ),
                TileInformationWidget(
                  text: "Contact us",
                  icon: EneftyIcons.call_received_outline,
                  onTap: () async {
                    await launchUrl(Uri.parse(
                        "mailto:${controller.email}?subject=customers support&body=mail here"));
                  },
                ),
                TileInformationWidget(
                  text: "Log out",
                  icon: EneftyIcons.logout_outline,
                  onTap: () {
                    return controller.logOut();
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
