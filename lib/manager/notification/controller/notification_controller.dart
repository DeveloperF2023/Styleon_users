import 'package:get/get.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/manager/notification/data/fetch_notification_remote_datasource.dart';

import '../../../core/functions/handling_data.dart';
import '../../../model/notification_model.dart';

abstract class NotificationController extends GetxController {
  fetchNotification();
}

class NotificationControllerImpl extends NotificationController {
  FetchNotificationRemoteDataSource fetchNotificationRemoteDataSource =
      FetchNotificationRemoteDataSource(Get.find());
  AppServices appServices = Get.find();
  List<NotificationModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  fetchNotification() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await fetchNotificationRemoteDataSource.fetchNotification(
        appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print("Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }
}
