import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/SettingsAdmin/view_controller.dart';
import 'package:p_admin/core/constant/color.dart';

class SettingsEdit extends StatelessWidget {
  const SettingsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerAdmin controller = Get.find();

    TextEditingController titleController = TextEditingController(
        text: controller.data[0].settingsTitel ?? '');
    TextEditingController bodyController = TextEditingController(
        text: controller.data[0].settingsBody ?? '');

    return Scaffold(
      appBar: AppBar(
        title:  Text("280".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration:  InputDecoration(
                labelText: "281".tr,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: bodyController,
              maxLines: 4,
              decoration:  InputDecoration(
                labelText: "282".tr,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                await controller.editData(
                  title: titleController.text,
                  body: bodyController.text,
                );
              },
              icon: const Icon(Icons.save),
              label:  Text("283".tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
