import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../global/app_bar.dart';
import '../../controller/tracking_controller.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return GetBuilder<TrackingController>(builder: (controller) {
      return Scaffold(
        appBar: AppBarWidget(
          title: "Tracking",
          automaticallyImplyLeading: true,
          onPressed: () => Get.back(),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * .914,
                width: double.infinity,
                child: GoogleMap(
                  polylines: controller.polylineSet,
                  mapType: MapType.normal,
                  markers: controller.markers.toSet(),
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.googleMapController = googleMapController;
                  },
                  initialCameraPosition: controller.kGooglePlex!,
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
