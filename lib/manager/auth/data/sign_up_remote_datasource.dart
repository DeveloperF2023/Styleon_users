import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SignUpRemoteDataSource{
  CRUD crud;
  SignUpRemoteDataSource(this.crud);
  postData(String username,String email,String password, String phone)async{
    var response = await crud.postData(ApiConstants.SIGNUP_URL, {
      "username":username,
      "email":email,
      "password":password,
      "phone":phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}