import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AddToFavoriteRemoteDataSource{
  CRUD crud;
  AddToFavoriteRemoteDataSource(this.crud);
  addToFavorite(String productId, String userId)async{
    var response = await crud.postData(ApiConstants.ADD_FAVORITE_URL, {"productId":productId.toString(),"userId":userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}