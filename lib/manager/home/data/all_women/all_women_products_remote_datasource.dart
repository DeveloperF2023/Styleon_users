import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllWomenProductsRemoteDataSource {
  CRUD crud;
  AllWomenProductsRemoteDataSource(this.crud);
  allWomenProducts() async {
    var response = await crud.postData(ApiConstants.WOMEN_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
