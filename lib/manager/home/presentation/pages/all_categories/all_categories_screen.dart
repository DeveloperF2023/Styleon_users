import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/routes.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/all_categories/all_categories_list.dart';
import '../../widgets/header_widget.dart';

class AllCategoriesScreen extends GetView<HomeControllerImpl> {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              isLeading: true,
              onPressedFavorite: () {
                Get.toNamed(AppRoutes.favoritePage);
              },
            ),
            AllCategoriesList(),
          ],
        ),
      )),
    );
  }
}
