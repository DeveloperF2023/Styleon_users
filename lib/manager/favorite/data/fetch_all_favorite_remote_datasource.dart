import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchAllFavoriteRemoteDataSource{
  CRUD crud;
  FetchAllFavoriteRemoteDataSource(this.crud);
  fetchAllFavorite(String userId)async{
    var response = await crud.postData(ApiConstants.VIEW_FAVORITE_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}