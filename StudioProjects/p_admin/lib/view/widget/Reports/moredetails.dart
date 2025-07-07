import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reports_controller.dart';
import 'customcardReports.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ReportsController controller = Get.put(ReportsController());
    return    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            '309'.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '310'.tr, // categories_count
                  value: controller.data[0].categoriesCount
                      .toString(),
                  icon: Icons.category,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '311'.tr,
                  // subcategories_count
                  value: controller.data[0].subcategoriesCount
                      .toString(),
                  icon: Icons.subdirectory_arrow_right,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '312'.tr, // messages_count
                  value: controller.data[0].messagesCount
                      .toString(),
                  icon: Icons.message,
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '313'.tr, // notifications_count
                  value: controller.data[0].notificationsCount
                      .toString(),
                  icon: Icons.notifications,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '314'.tr, // orders_waiting
                  value: controller.data[0].ordersWaiting
                      .toString(),
                  icon: Icons.hourglass_empty,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '315'.tr,
                  // orders_preparing
                  value: controller.data[0].ordersPreparing
                      .toString(),
                  icon: Icons.kitchen,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '316'.tr,
                  // orders_with_delivery
                  value: controller.data[0].ordersWithDelivery
                      .toString(),
                  icon: Icons.motorcycle,
                  color: Colors.lightGreen,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '317'.tr, // orders_on_way
                  value: controller.data[0].ordersOnWay
                      .toString(),
                  icon: Icons.directions_car,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '318'.tr, // orders_done
                  value: controller.data[0].ordersDone
                      .toString(),
                  icon: Icons.done_all,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
