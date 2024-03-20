import '../../../core/class/crud.dart';
import '../../../core/constants/api_constants.dart';

class AddAddressRemoteDataSource {
  CRUD crud;
  AddAddressRemoteDataSource(this.crud);
  addAddress(String userId, String city, String street, String name, String lat,
      String long) async {
    var response = await crud.postData(ApiConstants.ADD_ADDRESS_URL, {
      "userid": userId,
      "city": city,
      "name": name,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }
}
