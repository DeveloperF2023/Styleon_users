import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyC83nEONptlqWKrampynKGOMe-6cxH7Unw',
            appId: '1:776385269772:android:654242980858ad79f5de29',
            messagingSenderId: '776385269772',
            projectId: 'shop-3e623'));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
