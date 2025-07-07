import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reports_controller.dart';
import 'customcardReports.dart';

class CustomNumberReports extends StatelessWidget {
  const CustomNumberReports({super.key});
  @override
  Widget build(BuildContext context) {
    ReportsController controller = Get.put(ReportsController());
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomCardReports(
                title: '285'.tr, // users_count
                value: controller.data[0].usersCount.toString(),
                icon: Icons.people,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomCardReports(
                title: '286'.tr, // orders_count
                value: controller.data[0].ordersCount.toString(),
                icon: Icons.receipt_long,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomCardReports(
                title: '287'.tr, // items_prescription_count
                value: controller.data[0].itemsPrescriptionCount.toString(),
                icon: Icons.medical_services,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomCardReports(
                title: '288'.tr, // items_active_count
                value:controller.data[0].itemsActiveCount.toString(),
                icon: Icons.check_circle,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomCardReports(
                title: '289'.tr, // coupons_active_count
                value: controller.data[0].couponsActiveCount.toString(),
                icon: Icons.card_giftcard,
                color: Colors.teal,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomCardReports(
                title: '290'.tr, // coupons_inactive_count
                value: controller.data[0].couponsInactiveCount.toString(),
                icon: Icons.cancel,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomCardReports(
                title: '291'.tr, // delivery_count
                value: controller.data[0].deliveryCount.toString(),
                icon: Icons.delivery_dining,
                color: Colors.brown,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomCardReports(
                title: '292'.tr, // items_count
                value: controller.data[0].itemsCount.toString(),
                icon: Icons.shopping_bag,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
