import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:p_admin/data/datasource/remote/admindeilvery_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/NotificationService.dart';
import 'deliveryview_controller.dart';

class AddDeilveryController extends GetxController{
  AdminDeilveryData adminDeilveryData = AdminDeilveryData(Get.find());
  NotificationService notificationService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  addData()async{
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name" : name.text ,
        "phone" : phone.text,
        "email": email.text,
        "password" : password.text,

      };
      var response = await adminDeilveryData.addDeilvery(data );
      print("========================================Controller  $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.deliveryview);
          DeliveryViewController c =Get.find();
          c.data.clear();
          c.getData();
        }
        else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

@override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password =  TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }


}