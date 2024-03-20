import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/manager/checkout/data/checkout_order_remote_datasource.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../model/address_model.dart';
import '../../address/data/view_address_remote_datasource.dart';
import '../../global/text_app.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  fetchAddress();
  goToDetailOrder();
  goToAddNewAddress();
}

class CheckoutControllerImpl extends CheckoutController {
  String? paymentMethod;
  String? deliveryType;
  String? addressID;
  AddressModel? addressModel;
  String? nameAddress;
  String? cityAddress;
  String? streetAddress;
  StatusRequest statusRequest = StatusRequest.none;
  ViewAddressRemoteDataSource viewAddressRemoteDataSource =
      ViewAddressRemoteDataSource(Get.find());
  CheckoutOrderRemoteDataSource checkoutOrderRemoteDataSource =
      CheckoutOrderRemoteDataSource(Get.find());
  AppServices appServices = Get.find();
  List<AddressModel> data = [];
  String? couponId;
  String? orderPrice;
  String? totalProducts;
  String? couponName;
  double priceDelivery = 10.0;
  double? totalPrice;
  String? discountCoupon;
  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseDeliveryType(val) {
    deliveryType = val;
    update();
  }

  @override
  chooseShippingAddress(val) {
    addressID = val;
    update();
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
        print("name of address is $cityAddress");
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
  void onInit() {
    fetchAddress();
    couponId = Get.arguments['couponId'];
    orderPrice = Get.arguments['orderPrice'];
    totalProducts = Get.arguments['totalProducts'];
    couponName = Get.arguments["couponName"];
    totalPrice = Get.arguments["totalPrice"];
    discountCoupon = Get.arguments["discountCoupon"];

    print("total products is $totalProducts");
    print(couponName);
    print("discount coupon is $totalPrice");
    print("discountCoupon is $discountCoupon");
    print(priceDelivery);
    super.onInit();
  }

  @override
  goToDetailOrder() {
    if (paymentMethod == null && deliveryType == null && addressID == null) {
      return Get.rawSnackbar(
        titleText: TextApp(
          text: "Error Fields",
          color: AppColors.white,
          fontSize: font16,
        ),
        messageText: TextApp(
          text: "All fields are required please select them",
          color: AppColors.white,
          fontSize: font14,
        ),
      );
    }
    if (paymentMethod == null) {
      return Get.rawSnackbar(
        titleText: TextApp(
          text: "Error Payment method",
          color: AppColors.white,
          fontSize: font16,
        ),
        messageText: TextApp(
          text: "Please select the payment method and retry",
          color: AppColors.white,
          fontSize: font14,
        ),
      );
    }

    if (deliveryType == null) {
      return Get.rawSnackbar(
        titleText: TextApp(
          text: "Error Delivery Type",
          color: AppColors.white,
          fontSize: font16,
        ),
        messageText: TextApp(
          text: "Please select the delivery type and retry",
          color: AppColors.white,
          fontSize: font14,
        ),
      );
    }
    if (addressID == null) {
      return Get.rawSnackbar(
        titleText: TextApp(
          text: "Error Address",
          color: AppColors.white,
          fontSize: font16,
        ),
        messageText: TextApp(
          text: "The address does not exist please add new address and retry",
          color: AppColors.white,
          fontSize: font14,
        ),
      );
    }

    Get.toNamed(AppRoutes.detailOrder, arguments: {
      "paymentMethod": paymentMethod.toString(),
      "orderPrice": orderPrice,
      "couponId": couponId,
      "priceDelivery": priceDelivery,
      "orderType": deliveryType.toString(),
      "addressId": addressID.toString(),
      "couponName": couponName,
      "totalPrice": totalPrice,
      "totalProducts": totalProducts,
      "discountCoupon": discountCoupon.toString(),
    });
  }

  @override
  goToAddNewAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }
}
