import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class LimitedOffersRemoteDataSource {
  CRUD crud;
  LimitedOffersRemoteDataSource(this.crud);
  limitedOffers() async {
    var response = await crud.postData(ApiConstants.LIMITED_OFFERS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
