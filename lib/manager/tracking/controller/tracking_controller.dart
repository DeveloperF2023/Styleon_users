import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/decode_polyline.dart';
import '../../../core/services/services.dart';
import '../../../model/order_model.dart';

class TrackingController extends GetxController {
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  OrderModel? orderModel;
  double? destinationLatitude;
  double? destinationLongitude;
  double? currentLatitude;
  double? currentLongitude;
  Set<Polyline> polylineSet = {};
  GoogleMapController? googleMapController;
  AppServices appServices = Get.find();
  List<OrderModel> data = [];
  StatusRequest statusRequest = StatusRequest.loading;

  getCurrentLocation() {
    kGooglePlex = CameraPosition(
        target: LatLng(
            orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0),
        zoom: 12.4746);
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(
            orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0)));
  }

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    getCurrentLocation();
    getLocationOfDelivery();
    initiatePolyline();
    print("this is destination latitude : $destinationLatitude");
    print("this is destination longitude : $destinationLongitude");
    super.onInit();
  }

  initiatePolyline() async {
    destinationLongitude = orderModel!.addressLong;
    destinationLatitude = orderModel!.addressLat;
    Future.delayed(const Duration(seconds: 2));
    polylineSet = await getPolyline(currentLatitude, currentLongitude,
        destinationLatitude, destinationLongitude);
    update();
  }

  getLocationOfDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc("${orderModel!.ordersId}")
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destinationLatitude = event.get("latitude");
        destinationLongitude = event.get("longitude");
        updateMarkerOfDeliveryFromFirebase(
            destinationLatitude!, destinationLongitude!);
      }
    });
  }

  updateMarkerOfDeliveryFromFirebase(double newLatitude, double newLongitude) {
    markers.removeWhere((element) => element.markerId.value == "destination");
    markers.add(Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(newLatitude, newLongitude)));
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
