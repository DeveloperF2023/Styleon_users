import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/services/services.dart';

import '../../../core/functions/handling_data.dart';
import '../../../model/order_model.dart';
import '../data/pending_order_remote_datasource.dart';
import '../data/remove_order_remote_datasource.dart';

abstract class OrderController extends GetxController {
  fetchPendingOrder();
  typeOfOrder(String value);
  typeOfPayment(String value);
  statusOfOrder(String value);
  refreshOrder();
  goToOrderDetails();
  deleteOrder(String orderId);
}

class OrderControllerImpl extends OrderController {
  PendingOrderRemoteDataSource pendingOrderRemoteDataSource =
      PendingOrderRemoteDataSource(Get.find());
  RemoveOrderRemoteDataSource removeOrderRemoteDataSource =
      RemoveOrderRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  AppServices appServices = Get.find();
  List<OrderModel> data = [];
  @override
  statusOfOrder(String value) {
    if (value == "2") {
      return "Pending approval";
    } else if (value == "3") {
      return "The order is being accepted";
    } else if (value == "4") {
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
  fetchPendingOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrderRemoteDataSource
        .pendingOrder(appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print("Controller of pending and accepted order $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  refreshOrder() {
    fetchPendingOrder();
  }

  loadData() async {
    await fetchPendingOrder();
  }

  @override
  void onInit() {
    fetchPendingOrder();
    super.onInit();
  }

  @override
  goToOrderDetails() {
    Get.toNamed(AppRoutes.orderDetail);
  }

  @override
  deleteOrder(orderId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await removeOrderRemoteDataSource.removeOrder(orderId);
    statusRequest = handlingData(response);
    print("Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToTrackingOrder(OrderModel orderModel) {
    Get.toNamed(AppRoutes.tracking, arguments: {"orderModel": orderModel});
  }
}
