import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/manager/home/controller/dress/search/search_dress_controller.dart';

import '../../../../../core/constants/routes.dart';
import '../../../../../core/enum/status_request.dart';
import '../../../../../core/functions/handling_data.dart';
import '../../../../../core/services/services.dart';
import '../../../../../model/banner_model.dart';
import '../../../../../model/brands_model.dart';
import '../../../../../model/products_model.dart';
import '../../../offers/data/brands/fetch_brands_remote_datasource.dart';
import '../../data/all_dress/all_dress_products_remote_datasource.dart';
import '../../data/banners/fetch_banners_remote_datasource.dart';

abstract class AllDressController extends SearchDressController {
  fetchDress();
  checkProductStock(int value);
  goToDetailProduct(ProductModel productModel);
  fetchBanners();
  fetchBrands();
  onPageChanged(int index);
}

class AllDressControllerImpl extends AllDressController {
  AllDressProductsRemoteDataSource allDressProductsRemoteDataSource =
      AllDressProductsRemoteDataSource(Get.find());
  FetchBannersRemoteDataSource fetchBannersRemoteDataSource =
      FetchBannersRemoteDataSource(Get.find());
  FetchBrandsRemoteDataSource fetchBrandsRemoteDataSource =
      FetchBrandsRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  List<ProductModel> dresses = [];
  int deliveryTime = 0;
  List<BannerModel> banners = [];
  List<BrandsModel> brands = [];
  int currentPage = 0;
  late PageController pageController;
  String username = "";
  @override
  checkProductStock(int value) {
    if (value != 0) {
      return "In Stock";
    } else {
      return "Out of stock";
    }
  }

  @override
  fetchDress() async {
    statusRequest = StatusRequest.loading;
    var response = await allDressProductsRemoteDataSource.allDressProducts();
    statusRequest = handlingData(response);
    print("------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response["data"];
        dresses.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToDetailProduct(ProductModel productModel) {
    Get.toNamed(AppRoutes.detailProduct,
        arguments: {"productModel": productModel});
  }

  @override
  void onInit() {
    searchDressController = TextEditingController();
    deliveryTime = appServices.sharedPreferences.getInt("deliveryTime")!;
    username = appServices.sharedPreferences.getString("username")!;
    print("my delivery time is $deliveryTime");
    pageController = PageController(initialPage: 0);
    fetchDress();
    fetchBanners();
    fetchBrands();
    super.onInit();
  }

  @override
  fetchBanners() async {
    statusRequest = StatusRequest.loading;
    var response = await fetchBannersRemoteDataSource.fetchBanners();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        banners.addAll(responseData.map((e) => BannerModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  fetchBrands() async {
    statusRequest = StatusRequest.loading;
    var response = await fetchBrandsRemoteDataSource.fetchBrands();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        brands.addAll(responseData.map((e) => BrandsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
