import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class TopSellingProductsRemoteDataSource {
  CRUD crud;
  TopSellingProductsRemoteDataSource(this.crud);
  topSellingProducts() async {
    var response =
        await crud.postData(ApiConstants.TOP_SELLING_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
