import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(MainControllerImp());
    return GetBuilder<MainControllerImp>(builder: (controller) {
      return Scaffold(
          body: controller.listPage[controller.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            items: controller.bottomNavigationBarItem,
            selectedItemColor: AppColors.textColor,
            elevation: 5.0,
            unselectedItemColor: AppColors.textColor,
            currentIndex: controller.currentPage,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                controller.currentPage = index;
              });
            },
          ));
    });
  }
}
