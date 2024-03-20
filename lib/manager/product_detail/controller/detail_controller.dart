import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/manager/product_detail/data/fetch_products_remote_datasource.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../model/products_model.dart';
import '../../../model/rating_detail_model.dart';
import '../../cart/data/add_to_cart_remote_datasource.dart';
import '../../cart/data/delete_from_cart_remote_datasource.dart';
import '../../cart/data/get_count_cart_remote_datasource.dart';
import '../../favorite/data/add_favorite_remote_datasource.dart';
import '../../global/text_app.dart';
import '../data/fetch_rating_remote_datasource.dart';

abstract class ProductDetailController extends GetxController {
  fetchQuestionForEachProduct();
  fetchDiscountProduct();
  getCountCart(int productId);
  addToCart(String productId);
  removeFromCart(String productId);
  fetchRating();
}

class ProductDetailControllerImpl extends ProductDetailController {
  late ProductModel productModel;

  FetchProductsRemoteDataSource fetchProductsRemoteDataSource =
      FetchProductsRemoteDataSource(Get.find());
  GetCountCartRemoteDataSource getCountCartRemoteDataSource =
      GetCountCartRemoteDataSource(Get.find());
  AddToCartRemoteDataSource addToCartRemoteDataSource =
      AddToCartRemoteDataSource(Get.find());
  RemoveFromCartRemoteDataSource removeFromCartRemoteDataSource =
      RemoveFromCartRemoteDataSource(Get.find());
  AddToFavoriteRemoteDataSource addToFavoriteRemoteDataSource =
      AddToFavoriteRemoteDataSource(Get.find());
  FetchRatingRemoteDataSource fetchRatingRemoteDataSource =
      FetchRatingRemoteDataSource(Get.find());
  AppServices appServices = Get.find();
  late StatusRequest statusRequest;
  List question = [];
  List discount = [];
  List products = [];
  List items = [];
  List<RatingDetailModel> rating = [];
  int? countCart;
  List subitems = [
    {"name": "Red", "id": 1, "active": '0'},
    {"name": "Yellow", "id": 2, "active": '1'},
    {"name": "Black", "id": 3, "active": '0'}
  ];
  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productModel'];
    countCart = await getCountCart(productModel.productId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initialData();
    fetchQuestionForEachProduct();
    fetchDiscountProduct();
    fetchRating();
    super.onInit();
  }

  @override
  fetchQuestionForEachProduct() async {
    question.clear();
    statusRequest = StatusRequest.loading;
    var response = await fetchProductsRemoteDataSource
        .fetchProductDetail(productModel.productId.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        question.addAll(response['question']['data']);
        print("data");
        print(question);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  fetchDiscountProduct() async {
    discount.clear();
    statusRequest = StatusRequest.loading;
    var response = await fetchProductsRemoteDataSource
        .fetchProductDetail(productModel.productId.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        discount.addAll(response['discount']['data']);
        print("discount");
        print(discount);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addToCart(productId) async {
    statusRequest = StatusRequest.loading;
    var response = await addToCartRemoteDataSource.addToFavorite(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response["status"]);
        print("success");
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
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response["status"]);
        print("success");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountCart(productId) async {
    statusRequest = StatusRequest.loading;
    var response = await getCountCartRemoteDataSource.getCountCart(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countCart = 0;
        countCart = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countCart);
        return countCart;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  add() {
    addToCart("${productModel.productId}");
    countCart = countCart! + 1;
    update();
  }

  remove() {
    if (countCart! > 0) {
      removeFromCart("${productModel.productId}");
      countCart = countCart! - 1;
      update();
    }
  }

  goToFetchAllQuestion() {
    Get.toNamed(AppRoutes.question);
  }

  addToFavorite(String productId) async {
    statusRequest = StatusRequest.loading;
    var response = await addToFavoriteRemoteDataSource.addToFavorite(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response["status"]);
        Get.rawSnackbar(
            title: "Notification",
            messageText: const TextApp(
              text: "The favorite added with successfully",
              color: Colors.white,
            ));
      } else {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const TextApp(
              text: "The favorite has added try to discover another products",
              color: Colors.white,
            ));
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  fetchRating() async {
    rating.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await fetchRatingRemoteDataSource
        .fetchRating(appServices.sharedPreferences.getInt('id').toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        rating.addAll(responseData.map((e) => RatingDetailModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }
}
