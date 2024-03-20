import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling_dataview.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../favorite/controller/favorite_controller.dart';
import '../../../controller/computer/all_computer_controller.dart';
import '../../widgets/all_offers/list_all_offers.dart';
import '../../widgets/computers/list_search_computer.dart';
import '../../widgets/header_widget.dart';

class AllComputerScreen extends StatelessWidget {
  const AllComputerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllComputerControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return GetBuilder<AllComputerControllerImpl>(builder: (controller) {
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
                controller.checkValueOfComputer(value);
              },
              controller: controller.searchComputerController,
              onPressedSearch: () {
                controller.onSearchComputer();
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
                            widget: !controller.isSearchComputer
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width10),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.computers.length,
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
                                              controller.computers[index]
                                                  .productId] = controller
                                              .computers[index].favorite;
                                          return ListOfAllOffers(
                                              productModel:
                                                  controller.computers[index]);
                                        }),
                                  )
                                : ListOfSearchOfAllComputer(
                                    searchList: controller.searchComputerList,
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
