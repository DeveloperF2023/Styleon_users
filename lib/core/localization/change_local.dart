import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop/core/services/services.dart';
import 'package:get/get.dart';

import '../functions/firebase_cloud_messaging_config.dart';

class LocaleController extends GetxController{
  Locale? language;
  AppServices appServices = Get.find();

  changeLanguage(String _languageCode){
    Locale locale = Locale(_languageCode);
    appServices.sharedPreferences.setString("language", _languageCode);
    Get.updateLocale(locale);
  }
  permissionLocation()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Location", "PLease activate your location");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Location", "Your location is denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Location", "Location permissions are permanently denied, we cannot request permissions.");
    }
    return await Geolocator.getCurrentPosition();
  }
  @override
  void onInit() {
    permissionLocation();
    requestPermissionOfNotification();
    firebaseCloudMessagingConfig();
    String? sharedPreferencesLanguage = appServices.sharedPreferences.getString("language");
    if(sharedPreferencesLanguage == "FR"){
      language = const Locale("FR");
    }else if(sharedPreferencesLanguage == "EN"){
      language = const Locale("EN");
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

}