import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/routes.dart';
import '../../../global/app_bar.dart';
import '../../controller/fetch_address.dart';
import '../widgets/fetch_address/row_content_widget.dart';
import '../widgets/fetch_address/search_bar_widget.dart';

class FetchAddressToPlaceOrder extends StatelessWidget {
  const FetchAddressToPlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAddressControllerImpl());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
      ),
      appBar: AppBarWidget(
        title: "Address",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.toNamed(AppRoutes.settingsPage);
        },
      ),
      backgroundColor: AppColors.white,
      body: GetBuilder<FetchAddressControllerImpl>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                const SearchBarWidget(),
                SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Colors.green,
                                    icon: Icons.edit,
                                    onPressed: (BuildContext context) {
                                      controller.goToEditAddress();
                                    },
                                    label: "Edit",
                                  )
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete_outline,
                                    onPressed: (BuildContext context) {
                                      controller.deleteAddress(int.parse(
                                          "${controller.data[index].addressId}"));
                                    },
                                    label: "Remove",
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: height5),
                                child: CardContentWidget(
                                  isOpen: controller.isOpen,
                                  onOpen: () {
                                    controller.openSection();
                                  },
                                  street:
                                      "${controller.data[index].addressStreet}",
                                  title:
                                      "${controller.data[index].addressName}",
                                  city: "${controller.data[index].addressCity}",
                                  phone:
                                      "${controller.appServices.sharedPreferences.getString("phone")}",
                                  onPressed: () {
                                    controller.deleteAddress(int.parse(
                                        '${controller.data[index].addressId}'));
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ));
      }),
    );
  }
}
