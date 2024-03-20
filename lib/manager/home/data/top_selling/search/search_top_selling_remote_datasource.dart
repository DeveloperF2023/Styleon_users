import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfTopSellingProductsRemoteDataSource {
  CRUD crud;
  SearchOfTopSellingProductsRemoteDataSource(this.crud);
  searchTopSellingProducts(String search) async {
    var response = await crud.postData(
        ApiConstants.SEARCH_TOP_SELLING_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
