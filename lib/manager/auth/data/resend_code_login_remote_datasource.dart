import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class ResendVerifyCodeRemoteDataSource{
  CRUD crud;
  ResendVerifyCodeRemoteDataSource(this.crud);
  resendCode(String email)async{
    var response = await crud.postData(ApiConstants.RESEND_URL, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}