import 'package:shop/core/class/crud.dart';
import 'package:shop/core/constants/api_constants.dart';

class SearchQuestionRemoteDataSource{
  CRUD crud;
  SearchQuestionRemoteDataSource(this.crud);
  searchQuestion(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_QUESTION_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}