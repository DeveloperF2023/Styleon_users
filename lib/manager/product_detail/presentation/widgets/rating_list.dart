import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';
import 'package:shop/manager/product_detail/presentation/widgets/rating_list_content.dart';

class RatingList extends StatelessWidget {
  const RatingList({super.key});

  @override
  Widget build(BuildContext context) {
    //GetView<ProductDetailControllerImpl>
    Get.put(ProductDetailControllerImpl());
    return GetBuilder<ProductDetailControllerImpl>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: screenHeight * .26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.rating.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RatingListContent(
                  ratingDetailModel: controller.rating[index]);
            }),
      );
    });
  }
}
