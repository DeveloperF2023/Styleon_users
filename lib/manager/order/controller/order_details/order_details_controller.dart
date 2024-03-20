import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop/core/enum/status_request.dart';

import '../../../../core/functions/handling_data.dart';
import '../../../../model/order_detail_model.dart';
import '../../../../model/order_model.dart';
import '../../data/detail_order_remote_datasource.dart';

abstract class OrderDetailsController extends GetxController {
  typeOfOrder(String value);
  typeOfPayment(String value);
  statusOfOrder(String value);
  selectArrowButton();
  selectOpenItem();
  fetchOrderProducts();
}

class OrderDetailsControllerImpl extends OrderDetailsController {
  OrderModel? orderModel;
  bool isOpen = false;
  bool isOpenItem = false;
  double? latitude;
  double? longitude;
  List<Marker> markers = [];
  Completer<GoogleMapController>? controllerMap;
  CameraPosition? kGooglePlex;
  DetailOrderRemoteDataSource detailOrderRemoteDataSource =
      DetailOrderRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<OrderDetailModel> data = [];

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    initialData();
    fetchOrderProducts();
    super.onInit();
  }

  initialData() {
    if (orderModel!.ordersType.toString() != "1") {
      kGooglePlex = CameraPosition(
          target: LatLng(
              orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0),
          zoom: 12.4746);
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
              orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0)));
      controllerMap = Completer<GoogleMapController>();
    } else {
      print(kGooglePlex);
    }
  }

  @override
  selectArrowButton() {
    if (isOpen == false) {
      isOpen = true;
    } else {
      isOpen = false;
    }
    update();
  }

  @override
  selectOpenItem() {
    if (isOpenItem == false) {
      isOpenItem = true;
    } else {
      isOpenItem = false;
    }
    update();
  }

  @override
  statusOfOrder(value) {
    if (value == "0") {
      return "Pending approval";
    } else if (value == "1") {
      return "The order is being prepared";
    } else if (value == "2") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  @override
  typeOfOrder(value) {
    if (value == "0") {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  @override
  typeOfPayment(value) {
    if (value == "0") {
      return "Cash on Delivery";
    } else {
      return "Credit Card Payment";
    }
  }

  @override
  fetchOrderProducts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailOrderRemoteDataSource
        .detailOrder(orderModel!.ordersId.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrderDetailModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
