import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyline(
    latitude, longitude, destinationLatitude, destinationLongitude) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineCoordinate = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$latitude,$longitude&destination=$destinationLatitude,$destinationLongitude&key=AIzaSyAbxUUFPtOMP9b1YEDojw6PFN5RklQxcKg";
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print("this is response body $responseBody");
  var points = responseBody['routes'][0]["overview_polyline"]['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(points);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineCoordinate
          .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  Polyline polyline = Polyline(
    polylineId: const PolylineId("poly"),
    color: Colors.blue,
    width: 10,
    points: polylineCoordinate,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    jointType: JointType.round,
    geodesic: true,
  );
  polylineSet.add(polyline);

  return polylineSet;
}
