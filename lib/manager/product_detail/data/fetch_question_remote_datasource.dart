import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class FetchQuestionRemoteDataSource{
  CRUD crud;
  FetchQuestionRemoteDataSource(this.crud);
  fetchQuestion()async{
    var response = await crud.postData(ApiConstants.QUESTION_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
