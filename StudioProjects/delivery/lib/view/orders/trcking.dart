import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/tracking_controller.dart';
import '../../core/functions/getdecodepolyline_openstreetmap.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController controller2 = Get.put(TrackingController());

    return Scaffold(
      appBar: AppBar(
        title: Text("203".tr),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: GetBuilder<TrackingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GoogleMap(
                      polylines: polylineSet2,
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.gmc = controllermap;
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildInfoBox(controller.distanceText),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.symmetric(vertical: 1),
                        height: 60,
                        child: MaterialButton(
                          minWidth: 100,
                          color: AppColor.primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            controller.donDelivery();
                          },
                          child: Text("201".tr),
                        ),
                      ),
                      Spacer(),
                      _buildInfoBox(controller.durationText),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoBox(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(8),
      color: Colors.grey.shade100,
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
  );
}
