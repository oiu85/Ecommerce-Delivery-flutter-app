
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/home_controller.dart';
import 'package:p_admin/core/constant/imageasset.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widget/home/cardadmin.dart';


class HomePage extends  StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("209".tr),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 3,
                  tablet: 4,
                  desktop: 5,
                ),
                mainAxisExtent: 150,

            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdmin(
                url: AppImageAsset.categories_admin,
                title: "200".tr,
                onClick: (){
                  Get.toNamed(AppRoute.categoriesview);
                },
              ),

              CardAdmin(
                url: AppImageAsset.subcategories_admin,
                title: "201".tr,
                onClick: (){
                  Get.toNamed(AppRoute.subcategoriesview);
                },
              ),

              CardAdmin(
                url: AppImageAsset.orders_admin,
                title: "208".tr,
                onClick: (){
                  Get.toNamed(AppRoute.ordershome);
                },
              ),

              CardAdmin(
                url: AppImageAsset.users_admin,
                title: "204".tr,
                onClick: (){
                  Get.toNamed(AppRoute.usersview);

                },
              ),


              CardAdmin(
                url: AppImageAsset.delivery,
                title: "203".tr,
                onClick: (){
                  Get.toNamed(AppRoute.deliveryview);

                },
              ),

              // CardAdmin(
              //   url: AppImageAsset.message,
              //   title: "Messages",
              //   onClick: (){
              //   },
              // ),

              CardAdmin(
                url: AppImageAsset.product,
                title: "202".tr,
                onClick: (){
                  Get.toNamed(AppRoute.itemsview);
                },
              ),

              CardAdmin(
                url: AppImageAsset.coupon,
                title: "207".tr,
                onClick: (){
                  Get.toNamed(AppRoute.couponview);
                },
              ),

              CardAdmin(
                url: AppImageAsset.report,
                title: "206".tr,
                onClick: (){
                  Get.toNamed(AppRoute.reports);
                },
              ),


              CardAdmin(
                url: AppImageAsset.settings,
                title: "205".tr,
                onClick: (){
                  Get.toNamed(AppRoute.settingsadmin);
                },
              ),



            ],)
        ],
      ),
    );
  }
}

