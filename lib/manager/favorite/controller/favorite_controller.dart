import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/global/controller/search_controller.dart';

import '../../../core/constants/routes.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../model/products_model.dart';
import '../../../model/user_favorite.dart';
import '../../global/text_app.dart';
import '../data/add_favorite_remote_datasource.dart';
import '../data/fetch_all_favorite_remote_datasource.dart';
import '../data/remove_favorite_for_user_remote_datasource.dart';
import '../data/remove_from_favorite_remote_datasource.dart';

abstract class FavoriteController extends SearchMixController {
  setFavorite(id, value);
  addToFavorite(String productId);
  removeFromFavorite(String productId);
  fetchAllFavorite();
  removeForUserFavorite(String favoriteId);
  goToDetailProduct(ProductModel productModel);
}

class FavoriteControllerImpl extends FavoriteController {
  Map isFavorite = {};
  List<UserFavorite> data = [];
  List favorites = [];
  StatusRequest statusRequest = StatusRequest.none;
  AddToFavoriteRemoteDataSource addToFavoriteRemoteDataSource =
      AddToFavoriteRemoteDataSource(Get.find());
  RemoveFromFavoriteRemoteDataSource removeFromFavoriteRemoteDataSource =
      RemoveFromFavoriteRemoteDataSource(Get.find());
  FetchAllFavoriteRemoteDataSource fetchAllFavoriteRemoteDataSource =
      FetchAllFavoriteRemoteDataSource(Get.find());
  RemoveFromFavoriteForUserRemoteDataSource
      removeFromFavoriteForUserRemoteDataSource =
      RemoveFromFavoriteForUserRemoteDataSource(Get.find());
  AppServices appServices = Get.find();
  String username = "";
  @override
  setFavorite(id, value) {
    isFavorite[id] = value;
    update();
  }

  @override
  addToFavorite(productId) async {
    favorites.clear();
    statusRequest = StatusRequest.loading;
    var response = await addToFavoriteRemoteDataSource.addToFavorite(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const TextApp(
              text: "The favorite added with successfully",
              color: Colors.white,
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  removeFromFavorite(productId) async {
    favorites.clear();
    statusRequest = StatusRequest.loading;
    var response = await removeFromFavoriteRemoteDataSource.removeFromFavorite(
        productId, appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const TextApp(
              text: "The favorite removed with successfully",
              color: Colors.white,
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  fetchAllFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await fetchAllFavoriteRemoteDataSource.fetchAllFavorite(
        appServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => UserFavorite.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    fetchAllFavorite();
    searchController = TextEditingController();
    username = appServices.sharedPreferences.getString("username")!;
    super.onInit();
  }

  @override
  removeForUserFavorite(favoriteId) {
    var response = removeFromFavoriteForUserRemoteDataSource
        .removeFromFavoriteUser(favoriteId);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    update();
  }

  @override
  goToDetailProduct(productModel) {
    Get.toNamed(AppRoutes.detailProduct,
        arguments: {"productModel": productModel});
  }
}
