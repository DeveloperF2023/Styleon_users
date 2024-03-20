import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/enum/status_request.dart';
import '../../../../../model/products_model.dart';
import '../../../controller/offers/all_offers_controller.dart';
import '../search/not_found_widget.dart';
import 'content_search_list.dart';

class ListOfSearchOfAllOffers extends GetView<AllOffersControllerImpl> {
  final List<ProductModel> searchOffers;
  const ListOfSearchOfAllOffers({super.key, required this.searchOffers});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOffersControllerImpl());
    return controller.statusRequest == StatusRequest.failure
        ? const NotFoundWidget()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.searchOffers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 280),
                itemBuilder: (BuildContext context, int index) {
                  return ContentOfSearchList(
                      productModel: controller.searchOffers[index]);
                }),
          );
  }
}
