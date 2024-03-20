import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class VerifyCodeRemoteDataSource{
  CRUD crud;
  VerifyCodeRemoteDataSource(this.crud);
  postData(String verifyCode,String email)async{
    var response = await crud.postData(ApiConstants.VERIFYCODE_URL, {
      "verify_code":verifyCode,
      "email":email,

    });
    return response.fold((l) => l, (r) => r);
  }
}