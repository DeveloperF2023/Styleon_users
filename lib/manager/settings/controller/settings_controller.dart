import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/services/services.dart';

abstract class SettingsController extends GetxController {
  getInformationOfUser();
  logOut();
  goToOrders();
  goToArchive();
}

class SettingsControllerImpl extends SettingsController {
  AppServices appServices = Get.find();
  String? email;
  String? username;
  String? phone;
  @override
  getInformationOfUser() {
    email = appServices.sharedPreferences.getString("email");
    username = appServices.sharedPreferences.getString("username");
    phone = appServices.sharedPreferences.getString("phone");
  }

  @override
  void onInit() {
    getInformationOfUser();
    super.onInit();
  }

  @override
  logOut() {
    String usersID = appServices.sharedPreferences.getInt('id').toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$usersID");
    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  goToOrders() {
    Get.toNamed(AppRoutes.order);
  }

  @override
  goToArchive() {
    Get.toNamed(AppRoutes.orderArchive);
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }
}
