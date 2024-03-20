import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchRatingRemoteDataSource {
  CRUD crud;
  FetchRatingRemoteDataSource(this.crud);
  fetchRating(String userId) async {
    var response =
        await crud.postData(ApiConstants.RATING_URL, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
