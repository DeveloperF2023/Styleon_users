import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class CheckCouponRemoteDataSource{
  CRUD crud;
  CheckCouponRemoteDataSource(this.crud);
  checkCoupon(String couponName)async{
    var response = await crud.postData(ApiConstants.CHECK_COUPON_URL, {"couponName":couponName.toString()});
    return response.fold((l) => l, (r) => r);
  }
}