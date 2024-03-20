import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllDressRemoteDataSource {
  CRUD crud;
  SearchOfAllDressRemoteDataSource(this.crud);
  searchAllDress(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_DRESS_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
