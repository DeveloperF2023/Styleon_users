import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/manager/product_detail/controller/detail_controller.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../cart/presentation/pages/external_cart_page.dart';
import '../../../home/presentation/widgets/men/grid_men_list.dart';
import '../widgets/description_widget.dart';
import '../widgets/disount_product/discount_product_list.dart';
import '../widgets/flexible_space_bar.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/question_list.dart';
import '../widgets/rating_content.dart';
import '../widgets/sliver_app_bar.dart';
import '../widgets/title_and_price.dart';
import '../widgets/title_detail.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailControllerImpl());
    return GetBuilder<ProductDetailControllerImpl>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButtonWidget(
          onTapAddToCart: () {
            controller.add();
          },
          countCart: controller.countCart,
          onTapCart: () {
            Get.to(ExternalCartScreen());
          },
          onTapRemoveFromCart: () {
            controller.remove();
          },
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              automaticallyImplyLeading: false,
              pinned: true,
              title: SliverAppBarWidget(
                onTapBack: () {
                  Get.back();
                },
                onTapFavourite: () {
                  controller.addToFavorite(
                      controller.productModel.productId.toString());
                },
                countCart: controller.countCart.toString(),
                onTapCart: () {
                  Get.toNamed(AppRoutes.cartPage);
                },
              ),
              backgroundColor: AppColors.primaryColor,
              expandedHeight: MediaQuery.of(context).size.height * .41,
              flexibleSpace: FlexibleSpaceBarWidget(
                  tag: '${controller.productModel.productId}',
                  imageUrl:
                      "${ApiConstants.IMAGE_ITEMS}/${controller.productModel.productImage}"),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(bottom: height42 * 2.5),
                  child: Container(
                    color: AppColors.white,
                    width: double.infinity,
                    child: HandlingDataRequest(
                        statusRequest: controller.statusRequest,
                        widget: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Title + price+ old price
                              TitleAndPriceWidget(
                                productName:
                                    "${controller.productModel.productName}",
                                productPrice:
                                    "\$ ${controller.productModel.productPrice}",
                              ),

                              ///Rating+ number of reviews
                              RatingContentWidget(
                                productStock:
                                    controller.productModel.productStock!,
                              ),
                              sizeVertical(height10),

                              ///Description text
                              DescriptionWidget(
                                  description:
                                      "${controller.productModel.productDesc}"),

                              sizeVertical(height10),
                              controller.question.isNotEmpty
                                  ? Container(
                                      height: height20,
                                      width: double.infinity,
                                      color: AppColors.backGreyColor
                                          .withOpacity(0.4),
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              controller.question.isNotEmpty
                                  ? TitleOfEachSectionInDetail(
                                      onTap: () {
                                        controller.goToFetchAllQuestion();
                                      },
                                      text:
                                          'Question of this products (${controller.question.length})',
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              controller.question.isNotEmpty
                                  ? HandlingDataRequest(
                                      statusRequest: controller.statusRequest,
                                      widget: const QuestionList(),
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              controller.question.isNotEmpty
                                  ? Container(
                                      height: height20,
                                      width: double.infinity,
                                      color: AppColors.backGreyColor
                                          .withOpacity(0.4),
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              sizeVertical(20),
                              const TitleOfEachSectionInDetail(
                                text: 'New Offers 💥',
                                isTitle: true,
                              ),
                              sizeVertical(10),
                              HandlingDataRequest(
                                  statusRequest: controller.statusRequest,
                                  widget: const DiscountProductList()),
                              sizeVertical(height10),
                              const TitleOfEachSectionInDetail(
                                text: 'Men',
                                isTitle: true,
                              ),
                              const GridOfMenList(),
                            ],
                          ),
                        )),
                  )),
            )
          ],
        ),
      );
    });
  }
}
