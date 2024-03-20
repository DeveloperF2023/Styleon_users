import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling_dataview.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/women/all_women_controller.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/women/list_search_widget.dart';

class AllWomenScreen extends StatelessWidget {
  const AllWomenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllWomenControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<AllWomenControllerImpl>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            HeaderWidget(
              isLeading: true,
              onPressedFavorite: () {
                Get.toNamed(AppRoutes.favoritePage);
              },
              onChanged: (value) {
                controller.checkValueOfWomen(value);
              },
              controller: controller.searchWomenController,
              onPressedSearch: () {
                controller.onSearchWomen();
              },
              onNotification: () {},
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        HandlingDataRequest(
                            statusRequest: controller.statusRequest,
                            widget: !controller.isSearchWomen
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width10),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.women.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 8,
                                                crossAxisSpacing: 12,
                                                mainAxisExtent: 280),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          favoriteController.isFavorite[
                                                  controller
                                                      .women[index].productId] =
                                              controller.women[index].favorite;
                                          return ListOfAllOffers(
                                              productModel:
                                                  controller.women[index]);
                                        }),
                                  )
                                : ListOfSearchOfAllWomen(
                                    searchList: controller.searchWomenList,
                                  )),
                      ],
                    );
                  }),
            )
          ],
        )),
      );
    });
  }
}
