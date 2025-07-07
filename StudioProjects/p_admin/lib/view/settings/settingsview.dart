import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/SettingsAdmin/view_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/constant/routes.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerAdmin controller = Get.put(SettingsControllerAdmin());

    return Scaffold(
      appBar: AppBar(
        title:  Text("278".tr),
      ),
      body: GetBuilder<SettingsControllerAdmin>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.data.isEmpty
              ?  Center(child: Text("279".tr))
              : Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: (){
                Get.toNamed(AppRoute.settingsadminedit);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.data[0].settingsTitel ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.data[0].settingsBody ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.grey2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
