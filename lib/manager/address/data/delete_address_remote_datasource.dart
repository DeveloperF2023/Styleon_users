import '../../../core/class/crud.dart';
import '../../../core/constants/api_constants.dart';

class DeleteAddressRemoteDataSource {
  CRUD crud;
  DeleteAddressRemoteDataSource(this.crud);
  deleteAddress(String addressId) async {
    var response = await crud
        .postData(ApiConstants.REMOVE_ADDRESS_URL, {"addressId": addressId});
    return response.fold((l) => l, (r) => r);
  }
}
