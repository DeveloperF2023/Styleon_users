import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchProductsRemoteDataSource {
  CRUD crud;
  FetchProductsRemoteDataSource(this.crud);
  fetchProductDetail(String productId) async {
    var response = await crud
        .postData(ApiConstants.FETCH_DETAIL_URL, {"productId": productId});
    return response.fold((l) => l, (r) => r);
  }
}
