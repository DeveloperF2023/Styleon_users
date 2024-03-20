import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllDressProductsRemoteDataSource {
  CRUD crud;
  AllDressProductsRemoteDataSource(this.crud);
  allDressProducts() async {
    var response = await crud.postData(ApiConstants.DRESS_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
