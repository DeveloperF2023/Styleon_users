import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/functions/firebase_cloud_messaging_config.dart';
import 'package:shop/manager/favorite/presentation/pages/favorite_page.dart';
import 'package:shop/manager/offers/presentation/pages/offers_screen.dart';

import '../../cart/presentation/pages/cart_screen.dart';
import '../../home/presentation/pages/home_page.dart';
import '../../settings/presentation/pages/setting_page.dart';

abstract class MainController extends GetxController {
  changePage(int currentpage);
}

class MainControllerImp extends MainController {
  int currentPage = 0;
  PageController? pageController;

  List<Widget> listPage = [
    const HomePage(),
    const FavoritePage(),
    const CartScreen(),
    const OffersScreen(),
    const SettingsPage(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = const [
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.home_2_bold),
        icon: Icon(EneftyIcons.home_2_outline),
        label: "Home"),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.heart_bold),
        icon: Icon(EneftyIcons.heart_outline),
        label: "Favorite"),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.shopping_bag_bold),
        icon: Icon(EneftyIcons.shopping_bag_outline),
        label: "Cart"),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.flash_circle_2_bold),
        icon: Icon(EneftyIcons.flash_circle_2_outline),
        label: "Offers"),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.profile_circle_bold),
        icon: Icon(EneftyIcons.profile_circle_outline),
        label: "Profile"),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    firebaseCloudMessagingConfig();
    super.onInit();
  }

  @override
  changePage(int currentpage) {
    currentPage = currentpage;
    update();
  }
}
