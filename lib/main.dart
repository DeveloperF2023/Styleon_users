import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shop/bindings.dart';
import 'package:shop/core/localization/change_local.dart';
import 'package:shop/core/localization/translation.dart';
import 'package:shop/core/services/services.dart';

import 'core/constants/stripe_apikeys.dart';
import 'routes.dart';

void main() async {
  Stripe.publishableKey = StripeApiKeys.publishableKey;
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: AppTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: localeController.language,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 35,
            color: Colors.black87,
          ),
          bodyText1: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      initialBinding: AppBindings(),
      getPages: routes,
    );
  }
}
