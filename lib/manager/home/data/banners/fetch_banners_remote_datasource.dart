import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchBannersRemoteDataSource{
  CRUD crud;
  FetchBannersRemoteDataSource(this.crud);
  fetchBanners()async{
    var response = await crud.postData(ApiConstants.FETCH_BANNERS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}