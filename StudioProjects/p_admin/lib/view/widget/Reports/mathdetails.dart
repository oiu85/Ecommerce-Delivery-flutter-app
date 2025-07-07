import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reports_controller.dart';
import 'customcardReports.dart';

class MathDetails extends StatelessWidget {
  const MathDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ReportsController controller = Get.put(ReportsController());
    return  Container(
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
            '319'.tr,
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
                  title: '320'.tr,
                  value: controller.data[0].avgOrdersPerUser
                      .toString(),
                  icon: Icons.calculate,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '321'.tr,
                  value: '${controller.data[0]
                      .activeItemsPercent}%',
                  icon: Icons.percent,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '322'.tr,
                  value: '${controller.data[0]
                      .activeCouponsPercent}%',
                  icon: Icons.local_offer,
                  color: Colors.orangeAccent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCardReports(
                  title: '323'.tr,
                  value: '${controller.data[0]
                      .doneOrdersPercent}%',
                  icon: Icons.task_alt,
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCardReports(
                  title: '324'.tr,
                  value: controller.data[0].stddevOrdersPerUser
                      .toString(),
                  icon: Icons.stacked_line_chart,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
