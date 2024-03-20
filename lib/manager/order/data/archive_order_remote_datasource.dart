import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class ArchiveOrderRemoteDataSource{
  CRUD crud;
  ArchiveOrderRemoteDataSource(this.crud);
  archiveOrder(String userId)async{
    var response = await crud.postData(ApiConstants.ARCHIVE_ORDER_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}