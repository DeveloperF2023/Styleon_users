import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/manager/address/data/add_address_remote_datasource.dart';

import '../../../core/functions/handling_data.dart';

abstract class AddressDetailsController extends GetxController {
  initialData();
  addNewAddress();
}

class AddressDetailsControllerImpl extends AddressDetailsController {
  late String lat;
  late String long;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController nameController;
  AddAddressRemoteDataSource addAddressRemoteDataSource =
      AddAddressRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  @override
  initialData() {
    cityController = TextEditingController();
    streetController = TextEditingController();
    nameController = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  @override
  addNewAddress() async {
    print(appServices.sharedPreferences.getInt("id")!);
    print('city : ${cityController.text}');
    print("street ${streetController.text}");
    print("name ${nameController.text}");
    print("latitude $lat");
    print("longitude $long");
    statusRequest = StatusRequest.loading;
    update();
    var response = await addAddressRemoteDataSource.addAddress(
      appServices.sharedPreferences.getInt("id")!.toString(),
      cityController.text,
      streetController.text,
      nameController.text,
      lat,
      long,
    );
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.main);
        Get.snackbar("Add New Address",
            "the ${nameController.text} added with successfully");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
