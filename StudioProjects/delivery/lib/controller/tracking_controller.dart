import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../core/class/statusrequest.dart';
import '../core/functions/getdecodepolyline_openstreetmap.dart';
import '../data/model/ordersmodel.dart';
import 'orders/accepted_controller.dart';
import '../core/constant/color.dart';

class TrackingController extends GetxController {
  OrdersAcceptedController ordersAcceptedController = Get.find();
  List<Marker> markers = [];
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  Timer? timer;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? destlat;
  double? destlong;

  double? currentlat;
  double? currentlong;
  String distanceText = "";
  String durationText = "";

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];

    destlat = double.parse(ordersModel.addressLat!.toString());
    destlong = double.parse(ordersModel.addressLong!.toString());


    cameraPosition = CameraPosition(
      target: LatLng(destlat!, destlong!),
      zoom: 40,
    );


    markers.add(
      Marker(
        markerId: MarkerId("dest"),
        position: LatLng(destlat!, destlong!),
        infoWindow: InfoWindow(title: "الوجهة"),
      ),
    );

    getCurrentLocation();
    refreshLocation();

    super.onInit();
  }

  void getCurrentLocation() {
    positionStream = Geolocator.getPositionStream().listen((Position? position) async {
      if (position != null) {
        currentlat = position.latitude;
        currentlong = position.longitude;


        markers.removeWhere((element) => element.markerId.value == "current");
        markers.add(
          Marker(
            markerId: MarkerId("current"),
            position: LatLng(currentlat!, currentlong!),
            infoWindow: InfoWindow(title: "موقعك الحالي"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );

        update();


        if (gmc != null) {
          gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
        }


        await initPolyLine();
      }
    });
  }

  refreshLocation() async {
    await Future.delayed(const Duration(seconds: 3));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (currentlat != null && currentlong != null) {
        FirebaseFirestore.instance
            .collection("delivery")
            .doc(ordersModel.ordersId!.toString())
            .set({
          "lat": currentlat,
          "long": currentlong,
          "deliveryid": myServices.sharedPreferences.getString("id"),
        });
      }
    });
  }

  Future<void> initPolyLine() async {
    if (currentlat == null || currentlong == null || destlat == null || destlong == null) {
      return;
    }

    await getPolyLineWithOSRM(currentlat!, currentlong!, destlat!, destlong!);

    if (routeDistance != null && routeDuration != null) {
      distanceText = "${(routeDistance! / 1000).toStringAsFixed(2)} كم";
      durationText = "${(routeDuration! / 60).toStringAsFixed(0)} دقيقة";
    }

    update();

    // تقريب الكاميرا لتشمل المسار
    if (gmc != null) {
      final bounds = _getLatLngBounds(
        LatLng(currentlat!, currentlong!),
        LatLng(destlat!, destlong!),
      );
      gmc!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 70));
    }
  }

  LatLngBounds _getLatLngBounds(LatLng pos1, LatLng pos2) {
    double southWestLat = pos1.latitude < pos2.latitude ? pos1.latitude : pos2.latitude;
    double southWestLng = pos1.longitude < pos2.longitude ? pos1.longitude : pos2.longitude;

    double northEastLat = pos1.latitude > pos2.latitude ? pos1.latitude : pos2.latitude;
    double northEastLng = pos1.longitude > pos2.longitude ? pos1.longitude : pos2.longitude;

    return LatLngBounds(
      southwest: LatLng(southWestLat, southWestLng),
      northeast: LatLng(northEastLat, northEastLng),
    );
  }

  donDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(ordersModel.ordersId.toString(), ordersModel.ordersUsersid.toString());
    Get.offAllNamed(AppRoute.homepage);
  }

  @override
  void onClose() {
    print("stream closed");
    positionStream?.cancel();
    timer?.cancel();
    gmc?.dispose();
    super.onClose();
  }
}
