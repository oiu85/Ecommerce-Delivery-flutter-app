
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controller/orders/details_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/customtextformglobal.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("146".tr), //Orders Details
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: GetBuilder<OrdersDetailsController>(
            builder: (controller) =>
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      // Order Items Card
                      Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.shopping_bag_outlined, color: Color(0xFF0D6E9E)),
                                  const SizedBox(width: 8),
                                  Text(
                                    "146".tr, // Order Details
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade50,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(2),
                                    1: FlexColumnWidth(1),
                                    2: FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            width: 0.7,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                          child: Text(
                                            "147".tr, // Product Name
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              color: Color(0xFF0D6E9E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: Text(
                                            "149".tr, // Quantity
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xFF0D6E9E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                          child: Text(
                                            "150".tr, // Price
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              color: Color(0xFF0D6E9E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                      controller.data.length,
                                          (index) =>
                                          TableRow(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Text(
                                                  "${controller.data[index].itemsName}", textAlign: TextAlign.start,
                                                  style: const TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Text(
                                                  "${controller.data[index].countitems}", textAlign: TextAlign.center,
                                                  style: const TextStyle(fontSize: 16,fontFamily: "ciro"),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Text(
                                                  "${controller.data[index].itemsPrice} \$",
                                                  textAlign: TextAlign.end, style: const TextStyle(fontSize: 16,fontFamily: "cairo"),
                                                ),
                                              ),
                                            ],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xBB129B63),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "151".tr, // Total Price
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${controller.ordersModel
                                          .ordersTotalprice!.round()} \$",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          controller.toggleUserDetails();
                        },
                        child: Text(controller.showUserDetails ? "إخفاء بيانات المستخدم" : "عرض بيانات المستخدم"),
                      ),

                      if (controller.showUserDetails)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow("355".tr, "${controller.ordersModel.ordersAge ?? 'غير محدد'}"),
                                _buildInfoRow("356".tr, "${controller.ordersModel.ordersHeight ?? 'غير محدد'} cm"),
                                _buildInfoRow("357".tr, "${controller.ordersModel.ordersWeight ?? 'غير محدد'} kg"),
                                _buildInfoRow("358".tr, "${controller.ordersModel.ordersGender ?? 'غير محدد'}"),
                                _buildInfoRow("359".tr, "${controller.ordersModel.ordersBloodType ?? 'غير محدد'}"),
                                _buildInfoRow("360".tr, "${controller.ordersModel.ordersAllergies ?? 'غير محددة'}"),
                                const Divider(),
                                _buildInfoRow("361".tr, "${controller.ordersModel.ordersDiseases ?? 'غير محدد'}"),
                                _buildInfoRow("362".tr, "${controller.ordersModel.ordersMedications ?? 'غير محدد'}"),
                                _buildInfoRow("363".tr, "${controller.ordersModel.ordersDoctornotes ?? 'غير محدد'}"),
                              ],
                            ),
                          ),
                        ),
                      if (controller.ordersModel.ordersType == 0) Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      color: Color(0xFF0D6E9E)),
                                  const SizedBox(width: 8),
                                  Text(
                                    "153".tr, // Shipping Address
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${controller.ordersModel
                                      .addressCity} ${controller.ordersModel
                                      .addressStreet} ${controller.ordersModel
                                      .addressName}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (controller.ordersModel.ordersType == 0) Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 5, // تقليل الظل
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.map_outlined,
                                      color: Color(0xFF0D6E9E)),
                                  const SizedBox(width: 8),
                                  Text(
                                    "153".tr, // Delivery Location
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: GoogleMap(
                                    mapType: MapType.normal,
                                    markers: controller.markers.toSet(),
                                    initialCameraPosition: controller
                                        .cameraPosition!,
                                    onMapCreated: (
                                        GoogleMapController controllermap) {
                                      controller.Completercontroller.complete(
                                          controllermap);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if(controller.ordersModel.ordersStatus == 0)
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "347".tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                              CustomTextFormGlobal(
                                hintText: "348".tr,
                                labelText: "349".tr,
                                iconDate: Icons.text_fields,
                                mycontroller: controller.reason,
                                valid: (val) => validInput(val!, 1, 60, ""),
                                isNumber: false,
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "350".tr,
                                      middleText: "351".tr,
                                      textConfirm: "352".tr,
                                      textCancel: "353".tr,
                                      confirmTextColor: Colors.white,
                                      buttonColor: AppColor.redDark,
                                      onConfirm: () {
                                        if (controller.reason.text.isNotEmpty) {
                                          controller.rejectOrder(
                                            controller.ordersModel.ordersId.toString(),
                                            controller.ordersModel.ordersUsersid.toString(),
                                            controller.reason.text,
                                          );
                                        }
                                        Get.back();
                                      },
                                      onCancel: () => Get.back(),
                                    );
                                  },
                                  icon: const Icon(Icons.cancel_outlined, color: AppColor.redLight),
                                  label:  Text(
                                    "347".tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                )),
      ),
    );
  }
}
Widget _buildInfoRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
