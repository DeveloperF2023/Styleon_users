import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop/core/class/handling_dataview.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../controller/address_controller.dart';
import '../widgets/arrow_back_button.dart';
import '../widgets/bottom_button_widget.dart';

class AddAddressToPlaceOrder extends StatelessWidget {
  const AddAddressToPlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllerImpl());
    return Scaffold(
      body: Container(
        child: GetBuilder<AddressControllerImpl>(builder: (addressController) {
          return HandlingDataRequest(
              statusRequest: addressController.statusRequest,
              widget: Column(
                children: [
                  addressController.kGooglePlex != null
                      ? Expanded(
                          child: Stack(
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition:
                                    addressController.kGooglePlex!,
                                markers: addressController.markers.toSet(),
                                onTap: (latLong) {
                                  addressController.addMarker(latLong);
                                },
                                onMapCreated: (GoogleMapController controller) {
                                  addressController.controllerMap!
                                      .complete(controller);
                                },
                              ),
                              Positioned(
                                  top: height20,
                                  left: width10,
                                  child: const ArrowBackButton()),
                              Positioned(
                                  bottom: height20,
                                  left: 0,
                                  right: 0,
                                  child: BottomButtonWidget(
                                    onTap: () {
                                      addressController.goToAddNameOfAddress();
                                    },
                                  ))
                            ],
                          ),
                        )
                      : const Center(
                          child: Text("null"),
                        ),
                ],
              ));
        }),
      ),
    );
  }
}
