import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class AllComputerProductsRemoteDataSource {
  CRUD crud;
  AllComputerProductsRemoteDataSource(this.crud);
  allComputerProducts() async {
    var response = await crud.postData(ApiConstants.COMPUTER_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
