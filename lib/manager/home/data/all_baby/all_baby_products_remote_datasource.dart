import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllBabyProductsRemoteDataSource {
  CRUD crud;
  AllBabyProductsRemoteDataSource(this.crud);
  allBabyProducts() async {
    var response = await crud.postData(ApiConstants.BABY_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
