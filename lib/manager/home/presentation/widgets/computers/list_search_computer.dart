import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../../model/products_model.dart';
import '../../../controller/computer/all_computer_controller.dart';
import '../all_offers/content_search_list.dart';

class ListOfSearchOfAllComputer extends GetView<AllComputerControllerImpl> {
  final List<ProductModel> searchList;
  const ListOfSearchOfAllComputer({super.key, required this.searchList});

  @override
  Widget build(BuildContext context) {
    Get.put(AllComputerControllerImpl());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.searchComputerList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
              mainAxisExtent: 280),
          itemBuilder: (BuildContext context, int index) {
            return ContentOfSearchList(
                productModel: controller.searchComputerList[index]);
          }),
    );
  }
}
