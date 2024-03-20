import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_men/search/search_men_remote_datasource.dart';

class SearchMenController extends GetxController {
  SearchOfAllMenRemoteDataSource searchOfAllMenRemoteDataSource =
      SearchOfAllMenRemoteDataSource(Get.find());

  final List<ProductModel> searchMenList = [];
  late TextEditingController searchMenController;
  bool isSearchMen = false;
  late StatusRequest statusRequest;

  checkValueOfMen(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchMen = false;
    }
    update();
  }

  onSearchMen() {
    isSearchMen = true;
    searchMen();

    update();
  }

  searchMen() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllMenRemoteDataSource
        .searchAllMen(searchMenController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchMenList.clear();
        List responseData = response['data'];
        searchMenList.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
