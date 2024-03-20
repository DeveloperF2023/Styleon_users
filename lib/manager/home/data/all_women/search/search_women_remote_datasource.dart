import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllWomenRemoteDataSource {
  CRUD crud;
  SearchOfAllWomenRemoteDataSource(this.crud);
  searchAllWomen(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_WOMEN_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
