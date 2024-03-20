import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchBrandsRemoteDataSource{
  CRUD crud;
  FetchBrandsRemoteDataSource(this.crud);
  fetchBrands()async{
    var response = await crud.postData(ApiConstants.FETCH_BRANDS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}