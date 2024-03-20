import '../../../core/class/crud.dart';
import '../../../core/constants/api_constants.dart';

class ViewAddressRemoteDataSource {
  CRUD crud;
  ViewAddressRemoteDataSource(this.crud);
  fetchAddress(String userId) async {
    var response =
        await crud.postData(ApiConstants.VIEW_ADDRESS_URL, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
