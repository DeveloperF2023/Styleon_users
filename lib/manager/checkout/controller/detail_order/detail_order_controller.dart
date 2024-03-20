import 'package:get/get.dart';

import '../../../../core/enum/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../../../../model/address_model.dart';
import '../../../address/data/view_address_remote_datasource.dart';
import '../../data/checkout_order_remote_datasource.dart';

abstract class DetailOrderController extends GetxController {
  fetchAddress();
  checkoutOrder();
}

class DetailOrderControllerImpl extends DetailOrderController {
  String? couponId;
  String? orderPrice;
  double? priceDelivery;
  String? paymentMethod;
  String? deliveryType;
  String? addressID;
  String? totalProducts;
  String? couponName;
  double? totalPrice;
  String? discountCoupon;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  bool? isOpen = false;
  double? priceOrder;
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  ViewAddressRemoteDataSource viewAddressRemoteDataSource =
      ViewAddressRemoteDataSource(Get.find());
  CheckoutOrderRemoteDataSource checkoutOrderRemoteDataSource =
      CheckoutOrderRemoteDataSource(Get.find());
  AppServices appServices = Get.find();

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    orderPrice = Get.arguments['orderPrice'];
    priceDelivery = Get.arguments['priceDelivery'];
    paymentMethod = Get.arguments['paymentMethod'];
    addressID = Get.arguments['addressId'];
    deliveryType = Get.arguments['orderType'];
    totalProducts = Get.arguments['totalProducts'];
    couponName = Get.arguments['couponName'];
    totalPrice = Get.arguments['totalPrice'];
    discountCoupon = Get.arguments['discountCoupon'];
    addressName = Get.arguments['addressName'];
    addressCity = Get.arguments['addressCity'];
    addressStreet = Get.arguments['addressStreet'];
    totalPriceOfOrder();
    print(totalPriceOfOrder);
    print("discount coupon is $totalPrice");
    print(totalProducts);
    print(couponName);
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

  selectArrowButton() {
    if (isOpen == false) {
      isOpen = true;
    } else {
      isOpen = false;
    }
    update();
  }

  @override
  checkoutOrder() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "userId": appServices.sharedPreferences.getInt("id").toString(),
      "addressId": addressID,
      "orderType": deliveryType.toString(),
      "priceDelivery": priceDelivery.toString(),
      "couponId": couponId.toString(),
      "orderPrice": orderPrice.toString(),
      "paymentMethod": paymentMethod.toString(),
      "discountCoupon": discountCoupon.toString()
    };
    print(
        "userId: ${appServices.sharedPreferences.getInt("id").toString()} \n address ID : ${addressID.toString()} \n orderType : ${deliveryType.toString()} \n coupon id: $couponId\n orderPrice:$orderPrice\n paymentMethod: ${paymentMethod.toString()}");
    var response = await checkoutOrderRemoteDataSource.checkoutOrder(data);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  totalPriceOfOrder() {
    priceOrder = totalPrice! + priceDelivery!;
    update();
  }

  choosePaymentMethod(val) {
    if (val == 0) {
      return "Cash";
    } else if (val == 1) {
      return "Credit Card";
    } else if (val == null) {
      return "null";
    }
    update();
  }
}
