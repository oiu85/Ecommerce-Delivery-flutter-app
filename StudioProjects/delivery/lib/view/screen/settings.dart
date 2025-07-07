import 'package:delivery/core/class/handlingdataview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controrller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GetBuilder<SettingsController>(builder: (controller)=>
        HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: Get.width / 2.5,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(AppImageAsset.oavatar),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "204".tr, // ممكن تغيره لمعلومات حقيقية
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (controller.data.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("205".tr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                         SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.person_outline, color: Colors.black54),
                            SizedBox(width: 10),
                            Text("${controller.data[0].deliveryName}", style: TextStyle(fontSize: 20,fontFamily: "Ciro")),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.phone_android, color: Colors.black54),
                            const SizedBox(width: 10),
                            Text("+963: ${controller.data[0].deliveryPhone}", style: const TextStyle(fontSize: 20,fontFamily: "Ciro")),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.date_range_outlined, color: Colors.black54),
                            const SizedBox(width: 10),
                            Text("${Jiffy.parse(controller.data[0].deliveryCreate!).format(pattern: "dd/MM/yyyy")}", style: const TextStyle(fontSize: 20,fontFamily: "Ciro")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // أزرار العمليات
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildActionTile(
                      icon: Icons.phone_callback_outlined,
                      label: '206'.tr,
                      onTap: () => launchUrl(Uri.parse("tel:+963996094461")),
                    ),
                    const SizedBox(height: 10),
                    _buildActionTile(
                      icon: Icons.exit_to_app,
                      label: '207'.tr,
                      iconColor: Colors.red,
                      onTap: () => controller.logout(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String label,
    Color iconColor = AppColor.primaryColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
