import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllShoesProductsRemoteDataSource {
  CRUD crud;
  AllShoesProductsRemoteDataSource(this.crud);
  allShoesProducts() async {
    var response = await crud.postData(ApiConstants.SHOES_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
