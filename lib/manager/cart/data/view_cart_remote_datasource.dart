import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class ViewCartRemoteDataSource{
  CRUD crud;
  ViewCartRemoteDataSource(this.crud);
  viewCart(String userId) async {
    var response = await crud.postData(ApiConstants.VIEW_CART_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}