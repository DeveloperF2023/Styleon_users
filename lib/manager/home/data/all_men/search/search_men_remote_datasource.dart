import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllMenRemoteDataSource {
  CRUD crud;
  SearchOfAllMenRemoteDataSource(this.crud);
  searchAllMen(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_MEN_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
