import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/manager/product_detail/data/search_question_remote_datasource.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../model/products_model.dart';
import '../../../model/question_model.dart';
import '../../offers/data/search_product_remote_datasource.dart';

class SearchMixController extends GetxController {
  SearchProductsRemoteDataSource searchProductsRemoteDataSource =
      SearchProductsRemoteDataSource(Get.find());
  SearchQuestionRemoteDataSource searchQuestionRemoteDataSource =
      SearchQuestionRemoteDataSource(Get.find());

  final List<ProductModel> searchList = [];
  List<ProductModel> searchOffers = [];
  late List<QuestionModel> searchQuestion = [];
  late TextEditingController searchController;
  bool isSearch = false;
  late StatusRequest statusRequest;

  checkValue(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchProducts() {
    isSearch = true;
    searchProducts();

    update();
  }

  onSearchOffers() {
    isSearch = true;
    searchOffersList();
    update();
  }

  searchProducts() async {
    statusRequest = StatusRequest.loading;
    var response = await searchProductsRemoteDataSource
        .searchProduct(searchController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchList.clear();
        List responseData = response['data'];
        searchList.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchQuestionList() async {
    statusRequest = StatusRequest.loading;
    var response = await searchQuestionRemoteDataSource
        .searchQuestion(searchController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //searchQuestion.clear();
        var responseData = response['data'];
        searchQuestion
            .addAll(responseData.map((e) => QuestionModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchOffersList() async {
    statusRequest = StatusRequest.loading;
    var response = await searchProductsRemoteDataSource
        .searchProduct(searchController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchOffers.clear();
        List responseData = response['data'];
        searchOffers.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onSearchQuestion() {
    isSearch = true;
    searchQuestionList();
    update();
  }
}
