import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_women/search/search_women_remote_datasource.dart';

class SearchWomenController extends GetxController {
  SearchOfAllWomenRemoteDataSource searchOfAllWomenRemoteDataSource =
      SearchOfAllWomenRemoteDataSource(Get.find());

  final List<ProductModel> searchWomenList = [];
  late TextEditingController searchWomenController;
  bool isSearchWomen = false;
  late StatusRequest statusRequest;

  checkValueOfWomen(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchWomen = false;
    }
    update();
  }

  onSearchWomen() {
    isSearchWomen = true;
    searchWomen();

    update();
  }

  searchWomen() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllWomenRemoteDataSource
        .searchAllWomen(searchWomenController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchWomenList.clear();
        List responseData = response['data'];
        searchWomenList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
