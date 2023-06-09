import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController
{
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  RxBool progressVisibility = false.obs;
  RxBool getLatLonButton = true.obs;
}