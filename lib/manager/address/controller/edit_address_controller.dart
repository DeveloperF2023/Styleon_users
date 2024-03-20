import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/services/services.dart';
import '../../../model/address_model.dart';
import '../data/edit_address_remote_datasource.dart';

abstract class EditAddressController extends GetxController {
  editAddress();
}

class EditAddressControllerImpl extends EditAddressController {
  EditAddressRemoteDataSource editAddressRemoteDataSource =
      EditAddressRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  List<AddressModel> data = [];
  String? addressID;
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  editAddress() async {}

  @override
  void onInit() {
    addressID = Get.arguments['addressID'];
    super.onInit();
  }
}
