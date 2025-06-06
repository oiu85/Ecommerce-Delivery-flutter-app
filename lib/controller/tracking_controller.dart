import 'dart:async';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../core/class/statusrequest.dart';

import '../core/functions/getdecodepolyline_openstreetmap.dart';
import '../data/model/ordersmodel.dart';
import 'orders/accepted_controller.dart';

class TrackingController extends GetxController{
  OrdersAcceptedController ordersAcceptedController = Get.find();
  List<Marker> markers= [];
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc ;
  CameraPosition? cameraPosition ;
  Timer? timer ;
  MyServices myServices = Get.find();
   StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;


  double? destlat;
  double? destlong;

  double? currentlat;
  double? currentlong;
  String distanceText = "";
  String durationText = "";



  getCurrentLocation(){
    cameraPosition = CameraPosition(
      target: LatLng(
          double.parse(ordersModel.addressLat!.toString()),
          double.parse(ordersModel.addressLong!.toString())
      ),              //the lat and the lang is double from DB but i parse it to string then to double in case there error
      zoom: 12.4746,
    );

    markers.add(
        Marker( markerId: MarkerId("dest"), position: LatLng(
            double.parse(ordersModel.addressLat!.toString()),
            double.parse(ordersModel.addressLong!.toString()))
        )
    );

    positionStream = Geolocator.getPositionStream().listen((Position? position) {
      currentlat = position!.latitude;
      currentlong = position.longitude;

         print("======================Current position ");
         print(position!.latitude.toString());
         print(position.longitude.toString());
         if(gmc!=null)
           {
             gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
           }
         markers.removeWhere((element)=>element.markerId.value=="current");
         markers.add(
             Marker( markerId: MarkerId("current"),
                 position: LatLng(position.latitude, position.longitude),
             ));
         update();
        });

  }
  refreshLocation()async{
    await Future.delayed(Duration(seconds: 3));
    timer = Timer.periodic(Duration(seconds: 10), (timer){
      FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId!.toString()).set({
        "lat": currentlat,
        "long": currentlong,
        "deliveryid" :  myServices.sharedPreferences.getString("id"),
      });
    });
  }



  initPolyLine() async {
    destlat = double.parse(ordersModel.addressLat!.toString());
    destlong = double.parse(ordersModel.addressLong!.toString());

    await Future.delayed(Duration(seconds: 3));
    await getPolyLineWithOSRM(currentlat!, currentlong!, destlat!, destlong!);

    // IF You Don't Want To Display the durations and distance comment the tow lines below

    if (routeDistance != null && routeDuration != null) {
      distanceText = "${(routeDistance! / 1000).toStringAsFixed(2)} كم";
      durationText = "${(routeDuration! / 60).toStringAsFixed(0)} دقيقة";
    }

    update();
  }

donDelivery()async{
  statusRequest= StatusRequest.loading;
  await ordersAcceptedController.doneDelivery(ordersModel.ordersId.toString(), ordersModel.ordersUsersid.toString());
  Get.offAllNamed(AppRoute.homepage);
}

  @override
  void onClose() {
    print("stream closed");
    positionStream?.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
  


  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    getCurrentLocation();
    refreshLocation();
    initPolyLine();
    super.onInit();
  }

}


// 1- get current position
// 2- trcking
// 3-
