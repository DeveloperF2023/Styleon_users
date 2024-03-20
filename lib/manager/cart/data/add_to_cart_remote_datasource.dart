import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AddToCartRemoteDataSource{
  CRUD crud;
  AddToCartRemoteDataSource(this.crud);
  addToFavorite(String productId, String userId)async{
    var response = await crud.postData(ApiConstants.ADD_CART_URL, {"productId":productId.toString(),"userId":userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}