import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/manager/global/controller/search_controller.dart';

import '../../../core/constants/routes.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../model/products_model.dart';
import '../data/offers_products_remote_datasource.dart';

abstract class OffersController extends SearchMixController {
  fetchOffers();
  checkProductStock(int value);
  goToDetailProduct(ProductModel productModel);
}

class OffersControllerImpl extends OffersController {
  OffersProductsRemoteDataSource offersProductsRemoteDataSource =
      OffersProductsRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  List<ProductModel> offers = [];
  int deliveryTime = 0;
  bool isFavorites = false;
  @override
  fetchOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await offersProductsRemoteDataSource.offers();
    statusRequest = handlingData(response);
    print("------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response["data"];
        offers.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    deliveryTime = appServices.sharedPreferences.getInt("deliveryTime")!;
    print("my delivery time is $deliveryTime");
    fetchOffers();
    super.onInit();
  }

  @override
  checkProductStock(value) {
    if (value != 0) {
      return "In Stock";
    } else {
      return "Out of stock";
    }
  }

  @override
  goToDetailProduct(productModel) {
    Get.toNamed(AppRoutes.detailProduct,
        arguments: {"productModel": productModel});
  }

  favoritesCheck() {
    if (isFavorites == true) {
      isFavorites = false;
    } else {
      isFavorites = true;
    }
    update();
  }
}
