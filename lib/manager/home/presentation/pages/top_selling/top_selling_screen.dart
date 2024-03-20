import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling_dataview.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/top_selling/top_selling_controller.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/top_selling/search_top_selling_list.dart';

class AllTopSellingScreen extends StatelessWidget {
  const AllTopSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TopSellingControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<TopSellingControllerImpl>(builder: (controller) {
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
                controller.checkValueOfTopSelling(value);
              },
              controller: controller.searchTopSellingController,
              onPressedSearch: () {
                controller.onSearchTopSelling();
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
                            widget: !controller.isSearchTopSelling
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width10),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.topSelling.length,
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
                                              controller.topSelling[index]
                                                  .productId] = controller
                                              .topSelling[index].favorite;
                                          return ListOfAllOffers(
                                              productModel:
                                                  controller.topSelling[index]);
                                        }),
                                  )
                                : ListOfSearchOfTopSelling(
                                    searchList: controller.searchTopSellingList,
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
