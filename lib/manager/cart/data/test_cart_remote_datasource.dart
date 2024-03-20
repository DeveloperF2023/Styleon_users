import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class TestCartRemoteDataSource{
  CRUD crud;
  TestCartRemoteDataSource(this.crud);
  testCart() async {
    var response = await crud.postData(ApiConstants.TEST_CART_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}