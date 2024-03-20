import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../global/app_bar.dart';
import '../../controller/favorite_controller.dart';
import '../widgets/favorite_grid_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImpl());
    return Scaffold(
      appBar: AppBarWidget(
        title: "Favorites",
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: GetBuilder<FavoriteControllerImpl>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchAllFavorite();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width10, vertical: height10),
                      child: Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent:
                                          screenHeight == 778 ? 230 : 260),
                              itemBuilder: (BuildContext context, int index) {
                                //favoriteController.isFavorite[controller.data[index]['product_id']] = controller.data[index]['favorite'];
                                return GridViewOfFavorite(
                                  favorite: controller.data[index],
                                );
                              })
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      })),
    );
  }
}
