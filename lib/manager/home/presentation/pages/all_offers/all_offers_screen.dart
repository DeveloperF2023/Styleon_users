import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../core/class/handling_dataview.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/offers/all_offers_controller.dart';
import '../../widgets/all_offers/header_off_offers.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/all_offers/search_list_all_offers.dart';
import '../../widgets/all_offers/search_section.dart';

class AllOffersScreen extends StatelessWidget {
  const AllOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOffersControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<AllOffersControllerImpl>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: [
            HeaderOfAllOffers(
              username: controller.username,
            ),
            SearchSection(
              onChanged: (value) {
                controller.checkValue(value);
              },
              controller: controller.searchController,
              onPressedSearch: () {
                controller.onSearchOffers();
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: screenHeight * .8,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          HandlingDataRequest(
                              statusRequest: controller.statusRequest,
                              widget: !controller.isSearch
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width10,
                                          vertical: width10),
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller.offers.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 8,
                                                  crossAxisSpacing: 12,
                                                  mainAxisExtent: 280),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            favoriteController.isFavorite[
                                                controller.offers[index]
                                                    .productId] = controller
                                                .offers[index].favorite;
                                            return ListOfAllOffers(
                                                productModel:
                                                    controller.offers[index]);
                                          }),
                                    )
                                  : ListOfSearchOfAllOffers(
                                      searchOffers: controller.searchOffers,
                                    )),
                        ],
                      ),
                    ),
                  );
                })
          ],
        )),
      );
    });
  }
}
