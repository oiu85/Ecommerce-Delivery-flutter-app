
import 'package:delivery/data/datasource/remote/deilvery_data.dart';
import 'package:delivery/data/model/dilverymodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/orders/pending_data.dart';
import '../data/model/ordersmodel.dart';

class SettingsController extends GetxController{

MyServices myServices = Get.find();

DeilveryData deilveryData = DeilveryData(Get.find());

List<DeilveryModel> data = [];
late StatusRequest statusRequest=  StatusRequest.loading;

  getInfo()async{
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await deilveryData.getData(myServices.sharedPreferences.getString("id")!);
      print("========================================Controller  $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          List listdata = response['data'];
          data.addAll(listdata.map((e)=>DeilveryModel.fromJson(e)));
        }
        else{
          statusRequest = StatusRequest.none;
        }
      }
      update();

  }

  logout(){
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    print("start intial");
    getInfo();
    super.onInit();
  }

}