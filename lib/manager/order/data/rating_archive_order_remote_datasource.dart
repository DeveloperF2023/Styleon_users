import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class RatingArchiveOrderRemoteDataSource {
  CRUD crud;
  RatingArchiveOrderRemoteDataSource(this.crud);
  ratingArchiveOrder(String rating, String noteRating, String orderId,
      String userId) async {
    var response = await crud.postData(ApiConstants.RATING_ARCHIVE_ORDER_URL,
        {"rating": rating, "noterating": noteRating, "orderid": orderId, "userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}
