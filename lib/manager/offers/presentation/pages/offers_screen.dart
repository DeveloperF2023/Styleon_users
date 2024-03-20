import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/manager/offers/controller/offers_controller.dart';

import '../../../../core/class/handling_dataview.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/routes.dart';
import '../../../favorite/controller/favorite_controller.dart';
import '../../../global/app_bar.dart';
import '../widgets/header_offers.dart';
import '../widgets/list_offers_widget.dart';
import '../widgets/search_offers.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<OffersControllerImpl>(builder: (controller) {
      return Scaffold(
        appBar: AppBarWidget(
          title: "Offers",
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              HeaderOffers(
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
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return HandlingDataRequest(
                          statusRequest: controller.statusRequest,
                          widget: !controller.isSearch
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width10),
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller.offers.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 8,
                                                  crossAxisSpacing: 12,
                                                  mainAxisExtent: 270),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            favoriteController.isFavorite[
                                                controller.offers[index]
                                                    .productId] = controller
                                                .offers[index].favorite;
                                            return ListOfOffersWidget(
                                                productModel:
                                                    controller.offers[index]);
                                          }),
                                    ),
                                  ],
                                )
                              : SearchOffersList(
                                  searchList: controller.searchList,
                                ));
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
