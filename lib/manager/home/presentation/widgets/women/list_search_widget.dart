import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../model/products_model.dart';
import '../../../controller/women/all_women_controller.dart';
import '../all_offers/content_search_list.dart';

class ListOfSearchOfAllWomen extends GetView<AllWomenControllerImpl> {
  final List<ProductModel> searchList;
  const ListOfSearchOfAllWomen({super.key, required this.searchList});

  @override
  Widget build(BuildContext context) {
    Get.put(AllWomenControllerImpl());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.searchWomenList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
              mainAxisExtent: 280),
          itemBuilder: (BuildContext context, int index) {
            return ContentOfSearchList(
                productModel: controller.searchWomenList[index]);
          }),
    );
  }
}
