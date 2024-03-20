import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class GetCountCartRemoteDataSource{
  CRUD crud;
  GetCountCartRemoteDataSource(this.crud);
  getCountCart(int productId, String userId) async {
    var response = await crud.postData(ApiConstants.GET_COUNT_URL, {"productId":productId.toString(),"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}