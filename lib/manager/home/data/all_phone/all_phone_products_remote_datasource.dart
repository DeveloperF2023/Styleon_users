import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllPhoneProductsRemoteDataSource {
  CRUD crud;
  AllPhoneProductsRemoteDataSource(this.crud);
  allPhoneProducts() async {
    var response = await crud.postData(ApiConstants.PHONE_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
