import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop/core/constants/routes.dart';
import 'package:shop/core/enum/status_request.dart';

abstract class AddressController extends GetxController{
  getCurrentLocation();
  addMarker(LatLng latLng);
  goToAddNameOfAddress();
}
class AddressControllerImpl extends AddressController{
   Completer<GoogleMapController>? controllerMap;
   Position? postion;
   List<Marker> markers = [];
   double? latitude;
   double? longitude;
  CameraPosition? kGooglePlex;
   StatusRequest statusRequest = StatusRequest.loading;
   @override
  getCurrentLocation() async {
     postion = await Geolocator.getCurrentPosition();
     kGooglePlex = CameraPosition(
       target: LatLng(postion!.latitude, postion!.longitude),
       zoom: 14.4746,
     );
     addMarker(LatLng(postion!.latitude, postion!.longitude));
      statusRequest = StatusRequest.none;
     update();
   }

  @override
  void onInit() {
    getCurrentLocation();
    controllerMap = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  addMarker(latLng) {
     markers.clear();
  markers.add(Marker(markerId: const MarkerId('1'),position: latLng));
  latitude = latLng.latitude;
  longitude = latLng.longitude;
  update();
  }


  @override
  goToAddNameOfAddress() {
    Get.toNamed(AppRoutes.addNameAddress,arguments: {
      "lat":latitude.toString(),
      "long":longitude.toString()
    });
  }}