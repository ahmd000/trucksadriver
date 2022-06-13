import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trucksadriver/model/Driver.dart';

import '../model/Futu.dart';
import 'GetXDriver.dart';

class GetXMarker extends GetxController {
  List<Marker> marker = [];
  var getxdriver = Get.put<GetXDriver>(GetXDriver());

  GetMarkerfromorder() {
    getxdriver.data.orders.forEach((element) async {
      marker.add(await latLng(element.startLocationAddress,
          LatLng(element.startLocationLat, element.startLocationLng), true));
      update();
    });
  }

  Future<Marker> latLng(String id, LatLng latLng, bool type) async {

    return Marker(
      markerId: MarkerId("id"),
      position: latLng,
      zIndex: 0,

      // icon: icon
    );
  }
}
