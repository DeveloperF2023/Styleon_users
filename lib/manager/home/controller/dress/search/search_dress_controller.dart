import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_dress/search/search_dress_remote_datasource.dart';

class SearchDressController extends GetxController {
  SearchOfAllDressRemoteDataSource searchOfAllDressRemoteDataSource =
      SearchOfAllDressRemoteDataSource(Get.find());

  final List<ProductModel> searchDressList = [];
  late TextEditingController searchDressController;
  bool isSearchDress = false;
  late StatusRequest statusRequest;

  checkValueOfDress(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchDress = false;
    }
    update();
  }

  onSearchDress() {
    isSearchDress = true;
    searchDress();

    update();
  }

  searchDress() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllDressRemoteDataSource
        .searchAllDress(searchDressController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchDressList.clear();
        List responseData = response['data'];
        searchDressList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
