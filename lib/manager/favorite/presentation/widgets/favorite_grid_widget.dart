import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/text_substring.dart';
import 'package:shop/core/functions/translate_database.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/user_favorite.dart';
import '../../../global/text_app.dart';
import '../../controller/favorite_controller.dart';

class GridViewOfFavorite extends GetView<FavoriteControllerImpl> {
  const GridViewOfFavorite({super.key, required this.favorite});
  final UserFavorite favorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: "${favorite.favoriteId}",
                  child: Container(
                    height: screenHeight * .22,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${ApiConstants.IMAGE_ITEMS}/${favorite.productImage}'))),
                  ),
                ),
                Positioned(
                    bottom: -height20,
                    right: width10,
                    child: GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: TextApp(
                              text: 'Remove ${favorite.productName}',
                              fontSize: font20,
                              fontWeight: FontWeight.w900,
                            ),
                            content: TextApp(
                              text:
                                  'Do you want really remove this product from favorites',
                              fontSize: font16,
                              fontWeight: FontWeight.w400,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.removeForUserFavorite(
                                      favorite.favoriteId.toString());
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height42,
                        width: width42,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Container(
                          height: height32,
                          width: width32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              shape: BoxShape.circle),
                          child: Icon(
                            EneftyIcons.trash_bold,
                            size: font20,
                            color: AppColors.notificationColor,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text:
                      '${translateDatabase(favorite.productName, favorite.productNameFr)}'
                          .intelliTrim(),
                  fontSize: font16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
                Row(
                  children: [
                    favorite.productDiscount != 0
                        ? Container(
                            decoration: BoxDecoration(
                                color: AppColors.priceTag.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.local_offer,
                                    color: AppColors.priceTag,
                                    size: 10,
                                  ),
                                  favorite.productDiscount != 0
                                      ? sizeHorizontal(1)
                                      : sizeHorizontal(0),
                                  TextApp(
                                    text: '${favorite.productDiscount}%'
                                        .intelliTrim(),
                                    fontSize: font12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.priceTag,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                    favorite.productDiscount != 0
                        ? sizeHorizontal(width5)
                        : sizeHorizontal(0),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.starColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        child: Center(
                          child: Row(
                            children: [
                              favorite.productStock != 0
                                  ? const Icon(
                                      Icons.pix_rounded,
                                      color: AppColors.starColor,
                                      size: 10,
                                    )
                                  : SizedBox(),
                              sizeHorizontal(1),
                              favorite.productStock != 0
                                  ? TextApp(
                                      text: favorite.productStock.toString(),
                                      fontSize: font12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.starColor,
                                    )
                                  : TextApp(
                                      text: "Out of stock",
                                      fontSize: font12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.starColor,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextApp(
                  text: '${favorite.productPrice}DH',
                  fontSize: font18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ],
            )
          ])),
    );
  }
}
