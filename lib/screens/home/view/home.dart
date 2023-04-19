import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
  }

  Future<void> permission()
  async {
        Map<Permission,PermissionStatus> status = await [
          Permission.location,
          Permission.camera,
          Permission.storage
        ].request();
  }
  HomeController get = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Location Finder"),
          leading: IconButton(onPressed: () {
            openAppSettings();
          }, icon: Icon(Icons.settings,color: Colors.white,)),
        ),
        body: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Visibility(
                   visible: get.getLatLonButton.value,
                   child: ElevatedButton(onPressed: () async {
                     get.getLatLonButton.value = false;
                     get.progressVisibility.value = true;
                     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                     get.lat.value = position.latitude;
                     get.lon.value = position.longitude;
                   }, child: Text("Find Latitude and Longitude"),),
                 ),
                get.lat.value == 0.0?
                Visibility(visible: get.progressVisibility.value,child: CircularProgressIndicator()):
                Obx(() =>  Text("Latitude: ${get.lat}\nLongitute: ${get.lon}",style: TextStyle(fontSize: 20),),),
                SizedBox(height: 20,),
                Visibility(
                  visible: get.lat==0.0?false:true,
                  child: ElevatedButton(onPressed: () {
                    Get.toNamed('map');
                  }, child: Text("See on Map")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
