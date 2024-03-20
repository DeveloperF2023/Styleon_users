import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchOfAllComputerRemoteDataSource {
  CRUD crud;
  SearchOfAllComputerRemoteDataSource(this.crud);
  searchAllComputer(String search) async {
    var response = await crud.postData(
        ApiConstants.SEARCH_COMPUTER_PRODUCTS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
