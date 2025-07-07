import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/admin_deilvery/deliveryview_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class DeliveryMan extends StatelessWidget {
  const DeliveryMan({super.key});

  @override
  Widget build(BuildContext context) {
    DeliveryViewController controller = Get.put(DeliveryViewController());

    return Scaffold(
      appBar: AppBar(
        title:  Text("259".tr),
        centerTitle: true,
        elevation: 3,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor,
        onPressed: () => Get.toNamed(AppRoute.deliveryadd),
        icon: const Icon(Icons.add),
        label:  Text("260".tr),
      ),
      body: GetBuilder<DeliveryViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final delivery = controller.data[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                          child: Icon(Icons.person, color: AppColor.primaryColor),
                        ),
                        title: Text(
                          delivery.deliveryName ?? '',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.phone_android, size: 18, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  "+963 ${delivery.deliveryPhone}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  "${"261".tr}: ${Jiffy.parse(delivery.deliveryCreate!).format(pattern: "dd/MM/yyyy")}",
                                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(Uri.parse("tel:+963${delivery.deliveryPhone}"));
                            },
                            icon: const Icon(Icons.call),
                            label:  Text("262".tr),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              Get.defaultDialog(
                                title: "263".tr,
                                titleStyle: const TextStyle(color: Colors.red),
                                middleText: "264".tr,
                                confirm: ElevatedButton(
                                  onPressed: () {
                                    controller.deleteDelivery(delivery.deliveryId.toString());
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                  child:  Text("265".tr),
                                ),
                                cancel: TextButton(
                                  onPressed: () => Get.back(),
                                  child:  Text("266".tr),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
