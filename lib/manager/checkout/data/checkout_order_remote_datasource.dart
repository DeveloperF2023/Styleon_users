import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class CheckoutOrderRemoteDataSource{
  CRUD crud;
  CheckoutOrderRemoteDataSource(this.crud);
  checkoutOrder(Map data)async{
    var response = await crud.postData(ApiConstants.CHECKOUT_ORDER_URL, data);
    return response.fold((l) => l, (r) => r);
  }
}