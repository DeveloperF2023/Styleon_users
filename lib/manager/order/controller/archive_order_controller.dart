import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../model/rating_detail_model.dart';
import '../../global/text_app.dart';
import '../data/archive_order_remote_datasource.dart';
import '../data/rating_archive_order_remote_datasource.dart';

abstract class ArchiveOrderController extends GetxController {
  typeOfOrder(String value);
  typeOfPayment(String value);
  statusOfOrder(String value);
  fetchArchiveOrder();
  ratingArchiveOrder(String orderId, double rating, String comment);
}

class ArchiveOrderControllerImpl extends ArchiveOrderController {
  ArchiveOrderRemoteDataSource archiveOrderRemoteDataSource =
      ArchiveOrderRemoteDataSource(Get.find());
  RatingArchiveOrderRemoteDataSource ratingArchiveOrderRemoteDataSource =
      RatingArchiveOrderRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  AppServices appServices = Get.find();
  List<RatingDetailModel> data = [];

  @override
  fetchArchiveOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrderRemoteDataSource
        .archiveOrder(appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print("Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => RatingDetailModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  statusOfOrder(value) {
    if (value == "0") {
      return "Pending approval";
    } else if (value == "1") {
      return "Order Processing";
    } else if (value == "2") {
      return "Dispatched";
    } else if (value == "3") {
      return "Out for Delivery";
    } else {
      return "Delivered";
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
  void onInit() {
    fetchArchiveOrder();
    super.onInit();
  }

  @override
  ratingArchiveOrder(String orderId, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingArchiveOrderRemoteDataSource.ratingArchiveOrder(
        rating.toString(),
        comment,
        orderId,
        appServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingData(response);
    print("Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: TextApp(
              text: "Rating notification",
              fontSize: font18,
              color: AppColors.white,
            ),
            messageText: TextApp(
              text: "The rating submitted successfully thank you",
              fontSize: font16,
              color: AppColors.white,
            ));
        fetchArchiveOrder();
      } else {
        print("failure rating");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
