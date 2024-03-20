import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/routes.dart';
import '../../../../model/products_model.dart';
import '../../../favorite/controller/favorite_controller.dart';
import '../../../home/presentation/widgets/header_widget.dart';
import '../../controller/product_controller.dart';
import '../widgets/grid_list_categories.dart';
import '../widgets/list_categorie_of_product.dart';
import '../widgets/search_grid_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImpl());
    FavoriteControllerImpl favoriteController =
        Get.put(FavoriteControllerImpl());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<ProductControllerImpl>(builder: (controller) {
          return SafeArea(
              child: Column(
            children: [
              HeaderWidget(
                hintText: "Search Products",
                isLeading: true,
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
              sizeVertical(10),
              !controller.isSearch
                  ? const CategoriesOfProductListView()
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              GetBuilder<ProductControllerImpl>(builder: (controller) {
                return HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width10,
                                ),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.data.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 12,
                                            mainAxisExtent: 280),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      favoriteController.isFavorite[controller
                                              .data[index]['product_id']] =
                                          controller.data[index]['favorite'];
                                      return GridViewOfCategories(
                                        product: ProductModel.fromJson(
                                            controller.data[index]),
                                      );
                                    })))
                        : SearchGridList(
                            searchList: controller.searchList,
                          ));
              })
            ],
          ));
        }));
  }
}
