import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllMenProductsRemoteDataSource {
  CRUD crud;
  AllMenProductsRemoteDataSource(this.crud);
  allMenProducts() async {
    var response = await crud.postData(ApiConstants.MEN_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
