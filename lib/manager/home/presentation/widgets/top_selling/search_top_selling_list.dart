import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../model/products_model.dart';
import '../../../controller/top_selling/top_selling_controller.dart';
import '../all_offers/content_search_list.dart';

class ListOfSearchOfTopSelling extends GetView<TopSellingControllerImpl> {
  final List<ProductModel> searchList;
  const ListOfSearchOfTopSelling({super.key, required this.searchList});

  @override
  Widget build(BuildContext context) {
    Get.put(TopSellingControllerImpl());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.searchTopSellingList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
              mainAxisExtent: 280),
          itemBuilder: (BuildContext context, int index) {
            return ContentOfSearchList(
                productModel: controller.searchTopSellingList[index]);
          }),
    );
  }
}
