import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllBabyRemoteDataSource {
  CRUD crud;
  SearchOfAllBabyRemoteDataSource(this.crud);
  searchAllBaby(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_BABY_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
