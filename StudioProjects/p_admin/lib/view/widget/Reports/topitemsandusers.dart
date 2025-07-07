import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reports_controller.dart';

class TopItemsAndUsers extends StatelessWidget {
  const TopItemsAndUsers({super.key});

  @override
  Widget build(BuildContext context) {
    ReportsController controller = Get.put(ReportsController());
    return Column(
      children: [
        Container(
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
                '305'.tr, // top_selling_items
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                (controller.data[0].topSellingItems as List).length,
                    (i) {
                  final item = controller.data[0]
                      .topSellingItems![i];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${i + 1}')),
                    title: Text(item.itemsNameAr.toString()),
                    subtitle: Text(item.itemsName.toString()),
                    trailing: Text(
                        '${"306".tr}: ${item.totalSold.toString()}'),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // ====== أكثر المستخدمين طلبًا ======
        Container(
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
                '307'.tr, // top_users
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                (controller.data[0].topUsers as List).length,
                    (i) {
                  final user = controller.data[0].topUsers![i];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${i + 1}')),
                    title: Text(user.usersName.toString()),
                    subtitle: Text(user.usersPhone.toString(),style: TextStyle(fontFamily: "Ciro"),),
                    trailing: Text(
                        '${"308".tr}: ${user.totalOrders}'),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
