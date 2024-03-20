import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling_dataview.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/men/all_men_controller.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/men/search_men_list.dart';

class AllMenScreen extends StatelessWidget {
  const AllMenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllMenControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<AllMenControllerImpl>(builder: (controller) {
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
                controller.checkValueOfMen(value);
              },
              controller: controller.searchMenController,
              onPressedSearch: () {
                controller.onSearchMen();
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
                            widget: !controller.isSearchMen
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width10),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.men.length,
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
                                                      .men[index].productId] =
                                              controller.men[index].favorite;
                                          return ListOfAllOffers(
                                              productModel:
                                                  controller.men[index]);
                                        }),
                                  )
                                : ListOfSearchOfAllMen(
                                    searchList: controller.searchMenList,
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
