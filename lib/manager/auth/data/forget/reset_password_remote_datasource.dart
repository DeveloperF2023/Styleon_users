import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class ResetPasswordRemoteDataSource{
  CRUD crud;
  ResetPasswordRemoteDataSource(this.crud);
  postData(String email,String password)async{
    var response = await crud.postData(ApiConstants.RESET_PASSWORD, {
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}