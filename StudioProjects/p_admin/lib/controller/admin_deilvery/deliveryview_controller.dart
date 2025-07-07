
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/admindeilvery_data.dart';
import '../../data/model/dilverymodel.dart';



class DeliveryViewController extends GetxController{

  AdminDeilveryData adminDeilveryData = AdminDeilveryData(Get.find());

  List<DeilveryModel>data = [];
  late StatusRequest statusRequest;

  getData()async{
    statusRequest = StatusRequest.loading;

    var response = await adminDeilveryData.getData();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => DeilveryModel.fromJson(e)).toList());
      }

      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  deleteDelivery(String id)async{
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await adminDeilveryData.delete(id);
      print("=============================controller : $response");
      if (response['status'] == "success") {
        data.removeWhere((element) => element.deliveryId == id);
        statusRequest = StatusRequest.success;
      }
      getData();
      update();

  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }

}