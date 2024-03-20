import 'package:get/get.dart';

validateInput(String value,int min,int max,String type){
  if(type == "username"){
    if(!GetUtils.isUsername(value)){
      return "username is required";
    }
  }

  if(type == "email"){
    if(!GetUtils.isEmail(value)){
      return "email is required";
    }
  }

  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(value)){
      return "phone number is required";
    }
  }
  if(value.isEmpty){
    return "can't be empty";
  }
  if(value.length<min){
    return "can't be less than $min";
  }

  if(value.length>max){
    return "can't be larger than $max";
  }
}