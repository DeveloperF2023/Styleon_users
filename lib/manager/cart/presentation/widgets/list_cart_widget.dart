import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class ListCartWidget extends StatelessWidget {
  const ListCartWidget(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.productPrice,
      this.onTapTrash,
      required this.count,
      this.onTapAdd,
      this.onTapRemove,
      required this.productStock});
  final String imageUrl;
  final String productName;
  final String productPrice;
  final int productStock;
  final String count;
  final Function()? onTapTrash;
  final Function()? onTapAdd;
  final Function()? onTapRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height10, horizontal: width10),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: screenHeight * .1,
                      width: screenWidth * .2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl)))),
                  sizeHorizontal(width5),
                  Padding(
                    padding: EdgeInsets.only(left: width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: screenWidth * .5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextApp(
                                      text: productName,
                                      fontSize: font20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textColor,
                                    ),
                                    Row(
                                      children: [
                                        TextApp(
                                          text: "Stock: ",
                                          fontWeight: FontWeight.w600,
                                          fontSize: font14,
                                          color: AppColors.grey600,
                                        ),
                                        TextApp(
                                          text: productStock.toString(),
                                          fontWeight: FontWeight.w600,
                                          fontSize: font14,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextApp(
                                          text: '$productPrice DH',
                                          fontSize: font16,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.textColor,
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            sizeHorizontal(width32),
                            Container(
                              height: height42 * 2,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.backGreyColor,
                              ),
                              child: Column(
                                children: [
                                  sizeVertical(height3),
                                  InkWell(
                                      onTap: onTapRemove,
                                      child: Icon(
                                        Icons.remove,
                                        color: AppColors.subtitleColor,
                                        size: 20,
                                      )),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.5,
                                      color: AppColors.subtitleColor!
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  //sizeVertical(height5),
                                  TextApp(
                                    text: count,
                                    fontSize: font16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor,
                                  ),
                                  //sizeVertical(height5),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.5,
                                      color: AppColors.subtitleColor!
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  //sizeVertical(height3),
                                  InkWell(
                                      onTap: onTapAdd,
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.subtitleColor,
                                        size: 20,
                                      )),
                                  sizeVertical(height3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
