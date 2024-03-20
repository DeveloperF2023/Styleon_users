import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/enum/status_request.dart';
import '../../../../../../core/functions/handling_data.dart';
import '../../../../../../model/products_model.dart';
import '../../../data/all_phone/search/search_phone_remote_datasource.dart';

class SearchPhoneController extends GetxController {
  SearchOfAllPhoneRemoteDataSource searchOfAllPhoneRemoteDataSource =
      SearchOfAllPhoneRemoteDataSource(Get.find());

  final List<ProductModel> searchPhoneList = [];
  late TextEditingController searchPhoneController;
  bool isSearchPhone = false;
  late StatusRequest statusRequest;

  checkValueOfPhone(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchPhone = false;
    }
    update();
  }

  onSearchPhone() {
    isSearchPhone = true;
    searchPhone();

    update();
  }

  searchPhone() async {
    statusRequest = StatusRequest.loading;
    var response = await searchOfAllPhoneRemoteDataSource
        .searchAllPhone(searchPhoneController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchPhoneList.clear();
        List responseData = response['data'];
        searchPhoneList
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
