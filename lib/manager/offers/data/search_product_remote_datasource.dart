import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchProductsRemoteDataSource{
  CRUD crud;
  SearchProductsRemoteDataSource(this.crud);
  searchProduct(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_PRODUCT_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
