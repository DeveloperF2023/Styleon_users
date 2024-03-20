import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllPhoneRemoteDataSource {
  CRUD crud;
  SearchOfAllPhoneRemoteDataSource(this.crud);
  searchAllPhone(String search) async {
    var response = await crud
        .postData(ApiConstants.SEARCH_PHONE_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
