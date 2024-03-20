import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_baby/search/search_baby_remote_datasource.dart';

class SearchBabyController extends GetxController {
  SearchOfAllBabyRemoteDataSource searchOfAllBabyRemoteDataSource =
      SearchOfAllBabyRemoteDataSource(Get.find());

  final List<ProductModel> searchBabyList = [];
  late TextEditingController searchBabyController;
  bool isSearchBaby = false;
  late StatusRequest statusRequest;

  checkValueOfBaby(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchBaby = false;
    }
    update();
  }

  onSearchBaby() {
    isSearchBaby = true;
    searchBaby();

    update();
  }

  searchBaby() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllBabyRemoteDataSource
        .searchAllBaby(searchBabyController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchBabyList.clear();
        List responseData = response['data'];
        searchBabyList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
