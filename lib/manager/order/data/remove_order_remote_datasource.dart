import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class RemoveOrderRemoteDataSource{
  CRUD crud;
  RemoveOrderRemoteDataSource(this.crud);
  removeOrder(String orderId)async{
    var response = await crud.postData(ApiConstants.REMOVE_ORDER_URL, {"orderId":orderId});
    return response.fold((l) => l, (r) => r);
  }
}