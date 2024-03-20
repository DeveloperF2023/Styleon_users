import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_computer/search/search_computer_remote_datasource.dart';

class SearchComputerController extends GetxController {
  SearchOfAllComputerRemoteDataSource searchOfAllComputerRemoteDataSource =
      SearchOfAllComputerRemoteDataSource(Get.find());

  final List<ProductModel> searchComputerList = [];
  late TextEditingController searchComputerController;
  bool isSearchComputer = false;
  late StatusRequest statusRequest;

  checkValueOfComputer(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchComputer = false;
    }
    update();
  }

  onSearchComputer() {
    isSearchComputer = true;
    searchComputer();

    update();
  }

  searchComputer() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllComputerRemoteDataSource
        .searchAllComputer(searchComputerController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchComputerList.clear();
        List responseData = response['data'];
        searchComputerList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
