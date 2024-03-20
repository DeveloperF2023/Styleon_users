import '../../../core/class/crud.dart';
import '../../../core/constants/api_constants.dart';

class UpdateCountDownRemoteDataSource {
  CRUD crud;
  UpdateCountDownRemoteDataSource(this.crud);
  countDown(int offersId, int newCountdownHours) async {
    var response = await crud.postData(ApiConstants.UPDATE_COUNT_DOWN_URL,
        {"offersId": offersId, "newCountdownHours": newCountdownHours});
    return response.fold((l) => l, (r) => r);
  }
}
