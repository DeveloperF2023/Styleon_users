import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/manager/offers/controller/offers_controller.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/enum/status_request.dart';
import '../../../../model/products_model.dart';
import '../../../global/text_app.dart';
import '../../../home/presentation/widgets/search/image_widget.dart';
import '../../../home/presentation/widgets/search/not_found_widget.dart';
import '../../../home/presentation/widgets/search/tag_container.dart';

class SearchOffersList extends GetView<OffersControllerImpl> {
  const SearchOffersList({super.key, required this.searchList});
  final List<ProductModel> searchList;
  @override
  Widget build(BuildContext context) {
    return controller.statusRequest == StatusRequest.failure
        ? NotFoundWidget()
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.goToDetailProduct(searchList[index]);
                },
                child: Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Product's image
                        ImageWidget(
                            imageUrl:
                                '${ApiConstants.IMAGE_ITEMS}/${searchList[index].productImage}'),
                        sizeHorizontal(width10),

                        ///Product's content
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            sizeVertical(height10),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.priceTag,
                                      borderRadius:
                                          BorderRadius.circular(radius5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width5, vertical: height3),
                                    child: TextApp(
                                      text: "${searchList[index].categoryName}",
                                      fontSize: font12,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextApp(
                              text: "${searchList[index].productName}",
                              fontSize: font22,
                              color: AppColors.textColor!.withOpacity(0.8),
                              fontWeight: FontWeight.w700,
                            ),
                            TagContainerWidget(
                              title: 'Price: ',
                              text: "\$${searchList[index].productPrice}",
                            ),
                            TagContainerWidget(
                              title: 'Stock: ',
                              text: "${searchList[index].productStock}",
                            ),

                            //TextApp(text: "${searchList[index].p}",fontSize: font16,color: AppColors.subtitleColor,fontWeight: FontWeight.w400,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
