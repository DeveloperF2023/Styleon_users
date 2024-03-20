import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/services/services.dart';

import '../../../core/constants/routes.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../model/coupon_model.dart';
import '../../../model/data_cart_model.dart';
import '../../../model/products_model.dart';
import '../../global/text_app.dart';
import '../data/add_to_cart_remote_datasource.dart';
import '../data/coupon/check_coupon.dart';
import '../data/delete_from_cart_remote_datasource.dart';
import '../data/view_cart_remote_datasource.dart';

abstract class CartController extends GetxController {
  addToCart(String productId);
  removeFromCart(String productId);
  viewCartData();
  resetVarCart();
  refreshCart();
  checkCoupon();
  totalPrice();
  goToCheckout();
}

class CartControllerImpl extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  ProductModel? productModel;
  AddToCartRemoteDataSource addToCartRemoteDataSource =
      AddToCartRemoteDataSource(Get.find());
  RemoveFromCartRemoteDataSource removeFromCartRemoteDataSource =
      RemoveFromCartRemoteDataSource(Get.find());
  ViewCartRemoteDataSource viewCartRemoteDataSource =
      ViewCartRemoteDataSource(Get.find());
  CheckCouponRemoteDataSource checkCouponRemoteDataSource =
      CheckCouponRemoteDataSource(Get.find());
  TextEditingController couponController = TextEditingController();
  AppServices appServices = Get.find();
  List<DataCartModel> data = [];
  CouponModel? couponModel;
  String countItems = "0";
  double orderPrice = 0.0;
  int discountCoupon = 0;
  String nameCoupon = "";
  String? couponId;

  @override
  addToCart(productId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addToCartRemoteDataSource.addToFavorite(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notifications",
            messageText: TextApp(text: "added with successfully"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFromCart(productId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await removeFromCartRemoteDataSource.removeFromCart(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print("------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response["status"]);
        Get.rawSnackbar(
            backgroundColor: AppColors.grey50!,
            titleText: const TextApp(text: "Notifications"),
            messageText: const TextApp(text: "removed with successfully"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  viewCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCartRemoteDataSource
        .viewCart(appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['dataCart']['status'] == "success") {
        List responseData = response['dataCart']['data'];
        Map responseCountPrice = response['countPrice'];
        data.clear();
        data.addAll(responseData.map((e) => DataCartModel.fromJson(e)));
        orderPrice = double.parse(responseCountPrice['totalPrice']);
        countItems = responseCountPrice['totalProducts'];
        print(" count price : $orderPrice and count products : $countItems ");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewCartData();
    super.onInit();
  }

  @override
  resetVarCart() {
    countItems = "0";
    orderPrice = 0.0;
    data.clear();
  }

  @override
  refreshCart() {
    resetVarCart();
    viewCartData();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await checkCouponRemoteDataSource.checkCoupon(couponController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> coupon = response['data'];
        couponModel = CouponModel.fromJson(coupon);
        discountCoupon = couponModel!.couponDiscount!;
        nameCoupon = couponModel!.couponName!;
        couponId = couponModel!.couponId!.toString();
      } else {
        discountCoupon = 0;
        couponId = null;
        Get.rawSnackbar(
            titleText: const TextApp(
              text: "Coupon",
            ),
            messageText: TextApp(
                text: "There is no coupon with ${couponController.text}"),
            backgroundColor: AppColors.backGreyColor,
            icon: const Icon(
              EneftyIcons.info_circle_outline,
              color: Colors.red,
            ));
      }
    }
    update();
  }

  @override
  totalPrice() {
    return (orderPrice - orderPrice * discountCoupon / 100);
  }

  @override
  goToCheckout() {
    data.isEmpty
        ? Get.snackbar("Alert", "The cart is empty")
        : Get.toNamed(AppRoutes.checkoutCart, arguments: {
            "couponId": couponId ?? "0",
            "orderPrice": orderPrice.toString(),
            "totalProducts": countItems.toString(),
            "couponName": nameCoupon,
            "totalPrice": totalPrice(),
            "discountCoupon": discountCoupon.toString()
          });
  }
}
