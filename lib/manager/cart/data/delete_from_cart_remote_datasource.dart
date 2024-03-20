import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class RemoveFromCartRemoteDataSource{
  CRUD crud;
  RemoveFromCartRemoteDataSource(this.crud);
  removeFromCart(String productId, String userId) async {
    var response = await crud.postData(ApiConstants.REMOVE_CART_URL, {"productId":productId.toString(),"userId":userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}