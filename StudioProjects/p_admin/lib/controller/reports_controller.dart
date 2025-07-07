import 'package:get/get.dart';
import 'package:p_admin/data/datasource/remote/reports_data.dart';
import 'package:p_admin/data/model/reportsmode.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

class ReportsController extends GetxController{

  ReportsData reportsData = ReportsData(Get.find());

  List<ReportsModel> data = [];
  late StatusRequest statusRequest;
  getData()async{
    print("before request===============================================");
    statusRequest = StatusRequest.loading;
    var response = await reportsData.getData();

    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e)=>ReportsModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }




}