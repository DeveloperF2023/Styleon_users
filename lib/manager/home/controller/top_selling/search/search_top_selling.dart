import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/top_selling/search/search_top_selling_remote_datasource.dart';

class SearchTopSellingController extends GetxController {
  SearchOfTopSellingProductsRemoteDataSource
      searchOfAllTopSellingRemoteDataSource =
      SearchOfTopSellingProductsRemoteDataSource(Get.find());

  final List<ProductModel> searchTopSellingList = [];
  late TextEditingController searchTopSellingController;
  bool isSearchTopSelling = false;
  late StatusRequest statusRequest;

  checkValueOfTopSelling(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchTopSelling = false;
    }
    update();
  }

  onSearchTopSelling() {
    isSearchTopSelling = true;
    searchTopSelling();

    update();
  }

  searchTopSelling() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllTopSellingRemoteDataSource
        .searchTopSellingProducts(searchTopSellingController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchTopSellingList.clear();
        List responseData = response['data'];
        searchTopSellingList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
