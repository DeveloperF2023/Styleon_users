import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/routes.dart';

import '../../../../core/class/handling_dataview.dart';
import '../../../../core/constants/app_constants.dart';
import '../../controller/home_controller.dart';
import '../widgets/baby/baby_gridview.dart';
import '../widgets/brands/list_brands.dart';
import '../widgets/categories/categories_list.dart';
import '../widgets/computers/computers_grid_list.dart';
import '../widgets/header_widget.dart';
import '../widgets/limited_offers.dart';
import '../widgets/men/grid_men_list.dart';
import '../widgets/products/product_list.dart';
import '../widgets/search/list_products_search.dart';
import '../widgets/title_row_widget.dart';
import '../widgets/top_selling/list_top_selling.dart';
import '../widgets/women/list_women.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            HeaderWidget(
              onPressedFavorite: () {
                Get.toNamed(AppRoutes.favoritePage);
              },
              onChanged: (value) {
                controller.checkValue(value);
              },
              controller: controller.searchController,
              onPressedSearch: () {
                controller.onSearchProducts();
              },
              onNotification: () {
                controller.goToNotification();
              },
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * .9,
                child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return HandlingDataRequest(
                          statusRequest: controller.statusRequest,
                          widget: !controller.isSearch
                              ? Column(
                                  children: [
                                    const LimitedOffers(),
                                    sizeVertical(10),
                                    TitleRowWidget(
                                      text: "46".tr,
                                      onPressed: () {
                                        controller.goToAllCategories();
                                      },
                                    ),
                                    sizeVertical(10),
                                    const CategoriesListView(),
                                    TitleRowWidget(
                                      text: '48'.tr,
                                      onPressed: () {
                                        controller.goToAllOffers();
                                      },
                                    ),
                                    const ProductListView(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "49".tr,
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.topSelling),
                                    ),
                                    const ListOfTopSelling(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "50".tr,
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.allWomen),
                                    ),
                                    const ListOfWomen(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "52".tr,
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.allBaby),
                                    ),
                                    const GridOfBabySection(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "51".tr,
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.allMen),
                                    ),
                                    const GridOfMenList(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "53".tr,
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.allComputers),
                                    ),
                                    const ComputerList(),
                                    sizeVertical(height10),
                                    TitleRowWidget(
                                      text: "Brands",
                                      isShowSeeAll: false,
                                    ),
                                    BrandsSection(),
                                  ],
                                )
                              : ListProductsSearch(
                                  searchList: controller.searchList,
                                ));
                    }),
              ),
            )
          ],
        )),
      );
    });
  }
}
