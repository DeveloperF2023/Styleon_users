import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_shoes/search/search_shoes_remote_datasource.dart';

class SearchShoesController extends GetxController {
  SearchOfAllShoesRemoteDataSource searchOfAllShoesRemoteDataSource =
      SearchOfAllShoesRemoteDataSource(Get.find());

  final List<ProductModel> searchShoesList = [];
  late TextEditingController searchShoesController;
  bool isSearchShoes = false;
  late StatusRequest statusRequest;

  checkValueOfShoes(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchShoes = false;
    }
    update();
  }

  onSearchShoes() {
    isSearchShoes = true;
    searchShoes();

    update();
  }

  searchShoes() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllShoesRemoteDataSource
        .searchAllShoes(searchShoesController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchShoesList.clear();
        List responseData = response['data'];
        searchShoesList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
