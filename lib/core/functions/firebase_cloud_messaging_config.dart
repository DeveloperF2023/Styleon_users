import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../manager/order/controller/orders_controller.dart';
import '../constants/colors.dart';

firebaseCloudMessagingConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("-----Notification-----");
    print(remoteMessage.notification?.body);
    print(remoteMessage.notification?.title);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        backgroundColor: AppColors.white,
        remoteMessage.notification!.title!,
        remoteMessage.notification!.body!);
    //refreshNotification(remoteMessage.data);
  });
}

requestPermissionOfNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

refreshNotification(Map<String, dynamic> data) {
  print("--------Refresh Notification---------");
  print("--------Page ID---------");
  print(data['pageid']);
  print("--------Page Name---------");
  print(data['pagename']);
  print("--------current Page---------");
  print(Get.currentRoute);

  if (Get.currentRoute == "/order" && data["pagename"] == "refreshorder") {
    OrderControllerImpl controller = Get.find();
    controller.refreshOrder();
  }
}
