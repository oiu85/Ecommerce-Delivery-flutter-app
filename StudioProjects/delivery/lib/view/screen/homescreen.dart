import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/alertexitapp.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>
          Scaffold(
            appBar: AppBar(
              title: Text("208".tr),
            ),
        drawer: Drawer(

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(child: controller.listPage.elementAt(controller.currentPage),
            onWillPop: (){
             Get.defaultDialog(
               title: "40".tr,
               titleStyle: const  TextStyle(fontWeight: FontWeight.bold, color: AppColor.redDark),
               middleText: "41".tr,
               onConfirm: (){
                 exit(0);
               },
               onCancel: (){

               },
               cancelTextColor: AppColor.red,
               confirmTextColor: AppColor.primaryColor,
               buttonColor: AppColor.thirdColor,
             );
          return Future.value(true);
            })
      ),
    );
  }
}
