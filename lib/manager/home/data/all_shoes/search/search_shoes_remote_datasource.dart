import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllShoesRemoteDataSource {
  CRUD crud;
  SearchOfAllShoesRemoteDataSource(this.crud);
  searchAllShoes(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_SHOES_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
