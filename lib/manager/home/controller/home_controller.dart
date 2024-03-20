import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/manager/offers/data/count_down_remote_datasource.dart';
import 'package:shop/manager/offers/data/update_count_down_remote_datasource.dart';
import 'package:shop/model/banner_model.dart';

import '../../../../core/enum/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../model/products_model.dart';
import '../../../model/brands_model.dart';
import '../../global/controller/search_controller.dart';
import '../../offers/data/brands/fetch_brands_remote_datasource.dart';
import '../data/home_remote_datasource.dart';
import '../data/offers/limited_offers_remote_datasource.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  fetchHomeData();
  goToProduct(List categories, int selected, String categoryId);
  goToNotification();
  goToDetailProduct(ProductModel productModel);
  goToAllOffers();
  goToAllCategories();
  fetchLimitedOffers();
  fetchBrands();
}

class HomeControllerImpl extends HomeController {
  AppServices appServices = Get.find();
  String? username;
  int? id;
  String? lang;
  String title = "";
  String firstBannerTitle = "";
  String firstBannerTitle1 = "";
  String firstBannerSubtitle = "";
  String firstBannerSubtitle1 = "";
  String firstBannerBody = "";
  String firstBannerBody1 = "";
  String firstBannerImage = "";
  String firstBannerBackgroundImages = "";
  String secondBannerTitle = "";
  String secondBannerTitle1 = "";
  String secondBannerSubtitle = "";
  String secondBannerSubtitle1 = "";
  String secondBannerBody = "";
  String secondBannerBody1 = "";
  String secondBannerImage = "";
  String secondBannerBackgroundImages = "";
  String thirdBannerTitle = "";
  String thirdBannerTitle1 = "";
  String thirdBannerSubtitle = "";
  String thirdBannerSubtitle1 = "";
  String thirdBannerBody = "";
  String thirdBannerBody1 = "";
  String thirdBannerImage = "";
  String thirdBannerBackgroundImages = "";
  String fourthBannerTitle = "";
  String fourthBannerTitle1 = "";
  String fourthBannerSubtitle = "";
  String fourthBannerSubtitle1 = "";
  String fourthBannerBody = "";
  String fourthBannerBody1 = "";
  String fourthBannerImage = "";
  String fourthBannerBackgroundImages = "";
  String body = "";
  String titleBanner = "";
  String subtitleBanner = "";
  String bodyBanner = "";
  String imageBanner = "";
  List<BrandsModel> brands = [];
  int deliveryTime = 0;
  late PageController pageController;
  int currentPage = 0;
  late StatusRequest statusRequest;
  HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource(Get.find());
  LimitedOffersRemoteDataSource limitedOffersRemoteDataSource =
      LimitedOffersRemoteDataSource(Get.find());
  CountDownRemoteDataSource countDownRemoteDataSource =
      CountDownRemoteDataSource(Get.find());
  UpdateCountDownRemoteDataSource updateCountDownRemoteDataSource =
      UpdateCountDownRemoteDataSource(Get.find());
  FetchBrandsRemoteDataSource fetchBrandsRemoteDataSource =
      FetchBrandsRemoteDataSource(Get.find());
  List colors = [
    const Color(0xff9C27B0),
    const Color(0xff2196F3),
    const Color(0xff009688),
    const Color(0xff8BC34A)
  ];
  List<BannerModel> offers = [];
  final RxInt countdownHours = 0.obs;
  List data = [];
  List categories = [];
  List items = [];
  List topSelling = [];
  List settings = [];
  List women = [];
  List baby = [];
  List men = [];
  List computers = [];
  List banners = [];
  bool isDone = false;
  @override
  initialData() {
    username = appServices.sharedPreferences.getString("username");
    id = appServices.sharedPreferences.getInt("id");
    lang = appServices.sharedPreferences.getString("language");
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    fetchHomeData();
    initialData();
    fetchLimitedOffers();
    pageController = PageController(initialPage: 0);
    fetchBrands();
    super.onInit();
  }

  @override
  fetchHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeRemoteDataSource.getData();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']["data"]);
        items.addAll(response['products']["data"]);
        topSelling.addAll(response['topSelling']["data"]);
        settings.addAll(response['settings']["data"]);
        women.addAll(response['women']['data']);
        baby.addAll(response['baby']['data']);
        men.addAll(response['men']['data']);
        computers.addAll(response['computer']['data']);
        banners.addAll(response['banners']['data']);
        titleBanner = banners[2]['banners_title'];
        subtitleBanner = banners[2]['banners_subtitle'];
        bodyBanner = banners[2]['banners_body'];
        imageBanner = banners[2]['banners_image'];

        ///First banner
        firstBannerTitle = banners[0]['banners_title'];
        firstBannerTitle1 = banners[0]['banners_title1'];
        firstBannerSubtitle = banners[0]['banners_subtitle'];
        firstBannerSubtitle1 = banners[0]['banners_subtitle1'];
        firstBannerBody = banners[0]['banners_body'];
        firstBannerBody1 = banners[0]['banners_body1'];
        firstBannerImage = banners[0]['banners_image'];
        firstBannerBackgroundImages = banners[0]['banners_background'];

        ///Second Banner
        secondBannerTitle = banners[1]['banners_title'];
        secondBannerTitle1 = banners[1]['banners_title1'];
        secondBannerSubtitle = banners[1]['banners_subtitle'];
        secondBannerSubtitle1 = banners[1]['banners_subtitle1'];
        secondBannerBody = banners[1]['banners_body'];
        secondBannerBody1 = banners[1]['banners_body1'];
        secondBannerImage = banners[1]['banners_image'];
        secondBannerBackgroundImages = banners[1]['banners_background'];

        ///third Banner
        thirdBannerTitle = banners[2]['banners_title'];
        thirdBannerTitle1 = banners[2]['banners_title1'];
        thirdBannerSubtitle = banners[2]['banners_subtitle'];
        thirdBannerSubtitle1 = banners[2]['banners_subtitle1'];
        thirdBannerBody = banners[2]['banners_body'];
        thirdBannerBody1 = banners[2]['banners_body1'];
        thirdBannerImage = banners[2]['banners_image'];
        thirdBannerBackgroundImages = banners[2]['banners_background'];

        ///Fourth Banner
        fourthBannerTitle = banners[3]['banners_title'];
        fourthBannerTitle1 = banners[3]['banners_title1'];
        fourthBannerSubtitle = banners[3]['banners_subtitle'];
        fourthBannerSubtitle1 = banners[3]['banners_subtitle1'];
        fourthBannerBody = banners[3]['banners_body'];
        fourthBannerBody1 = banners[3]['banners_body1'];
        fourthBannerImage = banners[3]['banners_image'];
        fourthBannerBackgroundImages = banners[3]['banners_background'];
        print(firstBannerTitle);
        title = settings[0]['settings_titlehome'];
        body = settings[0]['settings_bodyhome'];
        deliveryTime = settings[0]['settings_deliveryTime'];
        appServices.sharedPreferences.setInt("deliveryTime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  goToProduct(categories, selected, categoryId) {
    Get.toNamed(AppRoutes.product, arguments: {
      "categories": categories,
      "selected": selected,
      "categoryId": categoryId,
    });
  }

  goToProductDetails(ProductModel productModel) {
    Get.toNamed(AppRoutes.detailProduct,
        arguments: {"productModel": productModel});
  }

  @override
  goToNotification() {
    Get.toNamed(AppRoutes.notification);
  }

  @override
  goToDetailProduct(ProductModel productModel) {
    Get.toNamed(AppRoutes.detailProduct, arguments: {
      "productModel": productModel,
    });
  }

  @override
  goToAllCategories() {
    Get.toNamed(AppRoutes.allCategories);
  }

  @override
  goToAllOffers() {
    Get.toNamed(AppRoutes.allOffers);
  }

  checkProductStock(int value) {
    if (value != 0) {
      return "In Stock";
    } else {
      return "Out of stock";
    }
  }

  @override
  fetchLimitedOffers() async {
    offers.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await limitedOffersRemoteDataSource.limitedOffers();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        offers.addAll(responseData.map((e) => BannerModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  onDoneCount() {
    isDone = true;
    update();
  }

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
