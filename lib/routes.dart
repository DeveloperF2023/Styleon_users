import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/middle_ware/middle_ware.dart';
import 'package:shop/manager/about_us/presentation/pages/about_us_screen.dart';
import 'package:shop/manager/categories/presentation/pages/product_screen.dart';
import 'package:shop/manager/favorite/presentation/pages/favorite_page.dart';
import 'package:shop/manager/languages/presentation/pages/languages.dart';
import 'package:shop/manager/notification/presentation/pages/notification_screen.dart';
import 'package:shop/manager/offers/presentation/pages/offers_screen.dart';
import 'package:shop/manager/settings/presentation/pages/setting_page.dart';
import 'package:shop/manager/tracking/presentation/pages/tracking.dart';

import 'manager/address/presentation/pages/add_address.dart';
import 'manager/address/presentation/pages/add_detail_address.dart';
import 'manager/address/presentation/pages/edit_address.dart';
import 'manager/address/presentation/pages/fetch_address.dart';
import 'manager/auth/presentation/pages/authentication.dart';
import 'manager/auth/presentation/pages/forget_password/forget_password.dart';
import 'manager/auth/presentation/pages/reset_password/reset_password.dart';
import 'manager/auth/presentation/pages/success_pages/success_reset_password.dart';
import 'manager/auth/presentation/pages/success_pages/success_sigup.dart';
import 'manager/auth/presentation/pages/verify_code/verify_code.dart';
import 'manager/auth/presentation/pages/verify_code/verify_code_signup.dart';
import 'manager/cart/presentation/pages/cart_screen.dart';
import 'manager/checkout/presentation/pages/checkout_screen.dart';
import 'manager/checkout/presentation/pages/details_order/details_checkout_screen.dart';
import 'manager/home/presentation/pages/all_baby/all_baby_screen.dart';
import 'manager/home/presentation/pages/all_categories/all_categories_screen.dart';
import 'manager/home/presentation/pages/all_computers/all_computers_screen.dart';
import 'manager/home/presentation/pages/all_men/all_men_screen.dart';
import 'manager/home/presentation/pages/all_offers/all_offers_screen.dart';
import 'manager/home/presentation/pages/all_women/all_women_screen.dart';
import 'manager/home/presentation/pages/top_selling/top_selling_screen.dart';
import 'manager/main/presentation/pages/main_screen.dart';
import 'manager/onboard/presentation/pages/onboard_screen.dart';
import 'manager/order/presentation/pages/archives/archive_order.dart';
import 'manager/order/presentation/pages/order_details/order_details_screen.dart';
import 'manager/order/presentation/pages/order_screen.dart';
import 'manager/product_detail/presentation/pages/product_details.dart';
import 'manager/product_detail/presentation/pages/question/question_screen.dart';
import 'manager/splash/presentation/pages/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SplashScreen(),
      middlewares: [AppMiddleWare()]),
  //   //GetPage(name: "/", page: ()=>const TestView()),
  GetPage(name: AppRoutes.login, page: () => const AuthenticationPage()),
  GetPage(name: AppRoutes.onboarding, page: () => Onbording()),
  GetPage(
      name: AppRoutes.forgetPassword, page: () => const ForgetPasswordPage()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodePage()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpPage()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordPage()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.main, page: () => const MainScreen()),
  GetPage(name: AppRoutes.product, page: () => const ProductScreen()),
  GetPage(name: AppRoutes.offers, page: () => const OffersScreen()),
  GetPage(name: AppRoutes.allOffers, page: () => const AllOffersScreen()),
  GetPage(name: AppRoutes.detailProduct, page: () => const ProductDetail()),
  GetPage(name: AppRoutes.favoritePage, page: () => const FavoritePage()),
  GetPage(name: AppRoutes.settingsPage, page: () => const SettingsPage()),
  GetPage(name: AppRoutes.cartPage, page: () => const CartScreen()),
  GetPage(
      name: AppRoutes.allCategories, page: () => const AllCategoriesScreen()),
  GetPage(
      name: AppRoutes.addAddress, page: () => const AddAddressToPlaceOrder()),
  GetPage(
      name: AppRoutes.editAddress, page: () => const EditAddressToPlaceOrder()),
  GetPage(
      name: AppRoutes.viewAddress,
      page: () => const FetchAddressToPlaceOrder()),
  GetPage(
      name: AppRoutes.addNameAddress, page: () => const AddDetailOfAddress()),
  GetPage(name: AppRoutes.checkoutCart, page: () => const CheckoutScreen()),
  GetPage(name: AppRoutes.detailOrder, page: () => const DetailsOrderScreen()),
  GetPage(name: AppRoutes.order, page: () => const OrderScreen()),
  GetPage(name: AppRoutes.notification, page: () => const NotificationScreen()),
  GetPage(name: AppRoutes.orderDetail, page: () => const OrderDetailScreen()),
  GetPage(name: AppRoutes.orderArchive, page: () => const ArchiveOrderScreen()),
  GetPage(name: AppRoutes.question, page: () => const QuestionScreen()),
  GetPage(name: AppRoutes.tracking, page: () => const TrackingScreen()),
  GetPage(name: AppRoutes.allWomen, page: () => const AllWomenScreen()),
  GetPage(name: AppRoutes.allMen, page: () => const AllMenScreen()),
  GetPage(name: AppRoutes.allBaby, page: () => const AllBabyScreen()),
  GetPage(name: AppRoutes.allComputers, page: () => const AllComputerScreen()),
  GetPage(name: AppRoutes.topSelling, page: () => const AllTopSellingScreen()),
  GetPage(name: AppRoutes.language, page: () => const Language()),
  GetPage(name: AppRoutes.aboutUs, page: () => const AboutUsScreen()),
];
