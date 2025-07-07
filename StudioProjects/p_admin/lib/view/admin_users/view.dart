import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/core/class/handlingdataview.dart';

import '../../controller/admin_users/usersview_controller.dart';
import '../../core/constant/color.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewController controller = Get.put(UsersViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: GetBuilder<UsersViewController>(
        builder: (controller) =>
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.data.length,
                itemBuilder: (context, index) =>
                   Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      title: Text(
                        "${controller.data[index].usersName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "ciro",
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                  Icons.email, size: 16, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(
                                "${controller.data[index].usersEmail}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                  Icons.phone, size: 16, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(
                                "${controller.data[index].usersPhone}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Switch(
                        value: controller.data[index].usersApprove.toString() == "1",
                        activeColor: AppColor.primaryColor,
                        onChanged: (bool value) {
                          Get.defaultDialog(
                            title: "Alert",
                            content: Text("Are you Sure To ${value ? "Active" : "Inactive"} This User ?"),
                            onConfirm: (){
                              controller.unActiveUsers(controller.data[index].usersId.toString(), value ? "1" : "0", index,);
                              Get.back();
                            },
                            onCancel: (){
                          }
                          );

                        },
                      ),
                    ),
                  ),
            ),
          ),
    ),
    );
  }
}
