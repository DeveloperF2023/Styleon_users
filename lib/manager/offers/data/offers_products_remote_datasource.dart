import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class OffersProductsRemoteDataSource{
  CRUD crud;
  OffersProductsRemoteDataSource(this.crud);
  offers()async{
    var response = await crud.postData(ApiConstants.OFFERS_PRODUCTS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
