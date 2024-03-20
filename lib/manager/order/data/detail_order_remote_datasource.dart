import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class DetailOrderRemoteDataSource{
  CRUD crud;
  DetailOrderRemoteDataSource(this.crud);
  detailOrder(String orderId)async{
    var response = await crud.postData(ApiConstants.DETAIL_ORDER_URL, {"orderid":orderId});
    return response.fold((l) => l, (r) => r);
  }
}