import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class HomeRemoteDataSource{
  CRUD crud;
  HomeRemoteDataSource(this.crud);
  getData()async{
    var response = await crud.postData(ApiConstants.HOME_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}