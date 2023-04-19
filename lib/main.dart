import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/home/view/home.dart';
import 'package:google_maps/screens/map/view/map_screen.dart';


void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //1initialRoute: 'map',
      routes: {
        '/':(p0) => HomeScreen(),
        'map':(p0) => MapScreen(),
      },
    ),
  );
}