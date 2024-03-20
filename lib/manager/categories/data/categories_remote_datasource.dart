import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class CategoriesRemoteDataSource{
  CRUD crud;
  CategoriesRemoteDataSource(this.crud);
  getData(String categoryId,String userID)async{
    var response = await crud.postData(ApiConstants.PRODUCT_URL, {"id":categoryId.toString(),"userid":userID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}