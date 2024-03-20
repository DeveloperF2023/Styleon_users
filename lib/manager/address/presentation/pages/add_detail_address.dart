import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../auth/presentation/widgets/button_widget.dart';
import '../../../global/app_bar.dart';
import '../../controller/address_controller.dart';
import '../../controller/address_detail_controller.dart';
import '../widgets/address_detail/title_text_field.dart';
import '../widgets/text_field_address.dart';

class AddDetailOfAddress extends StatelessWidget {
  const AddDetailOfAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsControllerImpl());
    AddressControllerImpl addController = Get.put(AddressControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        title: "Address Details",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: GetBuilder<AddressDetailsControllerImpl>(
          builder: (addressController) {
        return HandlingDataRequest(
            statusRequest: addressController.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(vertical: height10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width20),
                      child: SizedBox(
                        height: screenHeight * .44,
                        width: screenWidth,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: addController.kGooglePlex!,
                          markers: addController.markers.toSet(),
                          onTap: (latLong) {
                            addController.addMarker(latLong);
                          },
                          onMapCreated: (GoogleMapController controller) {
                            addController.controllerMap!.complete(controller);
                          },
                        ),
                      ),
                    ),
                    sizeVertical(height20),
                    const TitleTextField(text: "City"),
                    sizeVertical(height5),
                    TextFieldOfAddressDetail(
                      suffixIcon: Icons.location_city,
                      hintText: "City",
                      controller: addressController.cityController,
                    ),
                    sizeVertical(height10),
                    const TitleTextField(text: "Street"),
                    sizeVertical(height5),
                    TextFieldOfAddressDetail(
                      suffixIcon: Icons.streetview,
                      hintText: "Street",
                      controller: addressController.streetController,
                    ),
                    sizeVertical(height10),
                    const TitleTextField(text: "Name"),
                    sizeVertical(height5),
                    TextFieldOfAddressDetail(
                      suffixIcon: Icons.near_me,
                      hintText: "Name",
                      controller: addressController.nameController,
                    ),
                    sizeVertical(height10),
                    ButtonWidget(
                      text: "Add Address",
                      onTap: () {
                        addressController.addNewAddress();
                      },
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
