import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware{
  int? get priority => 1;
  AppServices appServices = Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(appServices.sharedPreferences.getString("step")=="2"){
      return const RouteSettings(name: AppRoutes.main);
    }
    if(appServices.sharedPreferences.getString("step")=="1"){
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}