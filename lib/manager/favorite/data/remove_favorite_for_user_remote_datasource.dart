import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class RemoveFromFavoriteForUserRemoteDataSource{
  CRUD crud;
  RemoveFromFavoriteForUserRemoteDataSource(this.crud);
  removeFromFavoriteUser(String favoriteId) async {
    var response = await crud.postData(ApiConstants.REMOVE_FAVORITE_USER_URL, {"favoriteId":favoriteId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}