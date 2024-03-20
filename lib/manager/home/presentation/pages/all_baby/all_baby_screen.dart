import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../../../controller/home/baby/all_baby_controller.dart';
import '../../../../../core/class/handling_dataview.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/baby/all_baby_controller.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/baby/search_baby_list.dart';
import '../../widgets/header_widget.dart';

class AllBabyScreen extends StatelessWidget {
  const AllBabyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllBabyControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<AllBabyControllerImpl>(builder: (controller) {
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
                controller.checkValueOfBaby(value);
              },
              controller: controller.searchBabyController,
              onPressedSearch: () {
                controller.onSearchBaby();
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
                            widget: !controller.isSearchBaby
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width10),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.babies.length,
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
                                                  controller.babies[index]
                                                      .productId] =
                                              controller.babies[index].favorite;
                                          return ListOfAllOffers(
                                              productModel:
                                                  controller.babies[index]);
                                        }),
                                  )
                                : ListOfSearchOfAllBaby(
                                    searchList: controller.searchBabyList,
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
