import 'package:get/instance_manager.dart';
import 'package:shop/core/services/services.dart';

translateDatabase(columnFR,columnEN){
  AppServices appServices = Get.find();
  if(appServices.sharedPreferences.getString("language")=="FR"){
   return columnFR;
  }else{
    return columnEN;
  }
}