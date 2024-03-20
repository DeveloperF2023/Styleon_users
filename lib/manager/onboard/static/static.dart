import 'package:get/get.dart';
import 'package:shop/core/constants/image_assets.dart';

import '../../../model/onboarding_model.dart';

List<UnbordingModel> contents = [
  UnbordingModel(
      title: '5'.tr,
      image: ImageAssets.onBoardingFirstImage,
      description: "6".tr
      //choisissez votre produit préféré facilement, rapidement, en toute sécurité
      ),
  UnbordingModel(
      title: '7'.tr,
      image: ImageAssets.onBoardingSecondImage,
      description: "8".tr
      //nous avons +100 000 produits de haute qualité avec toutes les tailles et de belles couleurs rien que pour vous
      ),
  UnbordingModel(
      title: '9'.tr,
      image: ImageAssets.onBoardingThirdImage,
      description: "10".tr
      //vous pouvez payer tous les produits que vous voulez en toute sécurité et en toute simplicité
      ),
];
