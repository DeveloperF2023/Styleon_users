
import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class EditAddressRemoteDataSource{
  CRUD crud;
  EditAddressRemoteDataSource(this.crud);
  editAddress(String addressId,String city,String street,String name,String lat,String long)async{
    var response = await crud.postData(ApiConstants.EDIT_ADDRESS_URL, {
      "userId":addressId,
      "city":city,
      "name":name,
      "street":street,
      "lat":lat.toString(),
      "long":long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}