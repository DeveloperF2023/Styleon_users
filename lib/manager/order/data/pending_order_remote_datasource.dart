import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class PendingOrderRemoteDataSource{
  CRUD crud;
  PendingOrderRemoteDataSource(this.crud);
  pendingOrder(String userId)async{
    var response = await crud.postData(ApiConstants.PENDING_ORDER_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}