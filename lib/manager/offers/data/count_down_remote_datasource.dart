import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class CountDownRemoteDataSource {
  CRUD crud;
  CountDownRemoteDataSource(this.crud);
  countDown(int offersId) async {
    var response =
        await crud.postData(ApiConstants.GET_COUNT_URL, {"offersId": offersId});
    return response.fold((l) => l, (r) => r);
  }
}
