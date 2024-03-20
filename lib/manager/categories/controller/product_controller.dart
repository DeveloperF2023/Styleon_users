import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/manager/global/controller/search_controller.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../model/products_model.dart';
import '../data/categories_remote_datasource.dart';

abstract class ProductController extends GetxController {
  initialData();
  changeCategory(int val, String categoryId);
  getProductsOfCategories(String categoryId);
  goToDetailProductPage(ProductModel productModel);
}

class ProductControllerImpl extends SearchMixController {
  List categories = [];
  late int selectedCategory;
  String? categoryId;
  CategoriesRemoteDataSource testData = CategoriesRemoteDataSource(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  bool isFavorites = false;
  initialData() {
    categories = Get.arguments["categories"];
    selectedCategory = Get.arguments["selected"];
    categoryId = Get.arguments["categoryId"];
    getProductsOfCategories(categoryId!);
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    super.onInit();
  }

  changeCategory(val, categoryIdValue) {
    selectedCategory = val;
    categoryId = categoryIdValue;
    getProductsOfCategories(categoryId!);
    update();
  }

  getProductsOfCategories(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToDetailProductPage(ProductModel productModel) {
    Get.toNamed(AppRoutes.detailProduct, arguments: {
      "productModel": productModel,
    });
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
