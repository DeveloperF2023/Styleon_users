import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/manager/address/data/delete_address_remote_datasource.dart';

import '../../../core/functions/handling_data.dart';
import '../../../model/address_model.dart';
import '../data/view_address_remote_datasource.dart';

abstract class FetchAddressController extends GetxController {
  fetchAddress();
  deleteAddress(int addressId);
  goToEditAddress();
}

class FetchAddressControllerImpl extends FetchAddressController {
  ViewAddressRemoteDataSource viewAddressRemoteDataSource =
      ViewAddressRemoteDataSource(Get.find());
  DeleteAddressRemoteDataSource deleteAddressRemoteDataSource =
      DeleteAddressRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  List<AddressModel> data = [];
  bool isOpen = false;
  @override
  void onInit() {
    fetchAddress();
    super.onInit();
  }

  @override
  fetchAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await viewAddressRemoteDataSource.fetchAddress(
      appServices.sharedPreferences.getInt("id")!.toString(),
    );
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listAddress = response['data'];
        data.addAll(listAddress.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteAddress(addressId) {
    deleteAddressRemoteDataSource.deleteAddress(addressId.toString());
    data.removeWhere((element) => element.addressId == addressId);
    update();
  }

  openSection() {
    if (isOpen == false) {
      isOpen = true;
    } else {
      isOpen = false;
    }
    update();
  }

  @override
  goToEditAddress() {
    Get.toNamed(AppRoutes.editAddress);
  }
}
