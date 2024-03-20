import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/core/functions/check_internet.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class CRUD{
  Future<Either<StatusRequest,Map>> postData(String url,Map data) async{

     if(await checkInternet()){
       var response = await http.post(Uri.parse(url),body: data);
       print(response.statusCode);
       if(response.statusCode == 200 || response.statusCode == 201){
         var responseBody = jsonDecode(response.body);
         print(responseBody);
         return Right(responseBody);
       }
       else{
         return const Left(StatusRequest.serverFailure);
       }

     }else{
       return const Left(StatusRequest.offlineFailure);
     }
   }
  }


