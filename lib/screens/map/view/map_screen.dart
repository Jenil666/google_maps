
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home/controller/home_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  HomeController get = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: {
            Marker(
                markerId: const MarkerId("marker1"),
                position: LatLng(get.lat.value,get.lon.value)
            )
          },
          initialCameraPosition: CameraPosition(target: LatLng(get.lat.value,get.lon.value),zoom: 15),),
      ),
    );
  }
}
