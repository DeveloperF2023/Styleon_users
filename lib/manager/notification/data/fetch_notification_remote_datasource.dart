import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchNotificationRemoteDataSource{
  CRUD crud;
  FetchNotificationRemoteDataSource(this.crud);
  fetchNotification(String userId)async{
    var response = await crud.postData(ApiConstants.FETCH_NOTIFICATION_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}