import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/enum/status_request.dart';
import 'package:shop/manager/home/presentation/widgets/search/tag_container.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../model/products_model.dart';
import '../../../../global/text_app.dart';
import '../../../controller/home_controller.dart';
import 'image_widget.dart';
import 'not_found_widget.dart';

class ListProductsSearch extends GetView<HomeControllerImpl> {
  final List<ProductModel> searchList;
  const ListProductsSearch({super.key, required this.searchList});

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
                  controller.goToProductDetails(searchList[index]);
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width10, vertical: height10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Product's image
                          ImageWidget(
                              imageUrl:
                                  '${ApiConstants.IMAGE_ITEMS}/${searchList[index].productImage}'),
                          sizeHorizontal(width5),

                          ///Product's content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(radius5)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width10,
                                          vertical: height3),
                                      child: TextApp(
                                        text:
                                            "${searchList[index].categoryName}",
                                        fontSize: font14,
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
                              sizeVertical(height5),
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
                ),
              );
            });
  }
}
