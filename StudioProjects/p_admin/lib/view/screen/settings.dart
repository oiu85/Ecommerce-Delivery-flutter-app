
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';




import '../../controller/settings_controrller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white],
          stops: const [0.0, 0.3],
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
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
              ),
              Positioned(
                top: Get.width / 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage:  AssetImage(AppImageAsset.oavatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              elevation: 5,
              shadowColor: Colors.blue.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // _buildSettingItem(
                  //   title: '108'.tr, // Disable Notifications
                  //   trailing: Switch(
                  //     value: true,
                  //     onChanged: (val) {},
                  //     activeColor: AppColor.primaryColor,
                  //   ),
                  // ),
                  // _buildDivider(),

                  _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title: '110'.tr, // Archived Orders
                    trailing: const Icon(Icons.archive_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: '111'.tr, // Address
                    trailing: const Icon(Icons.location_on_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    title: '112'.tr, // About Us
                    trailing: const Icon(Icons.help_outline_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: ()async {
                      await launchUrl(Uri.parse("tel:+963996094461"));
                    },
                    title: '113'.tr, // Contact Us
                    trailing: const Icon(Icons.phone_callback_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    title: "114".tr, // Logout
                    trailing: const Icon(Icons.exit_to_app, color: Colors.red,size: 30),
                    onTap: () => controller.logout(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 0.2,
      thickness: 2,
      color: Colors.grey.withOpacity(0.1),
    );
  }
}
