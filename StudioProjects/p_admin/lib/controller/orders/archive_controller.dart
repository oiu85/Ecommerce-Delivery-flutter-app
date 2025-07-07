import 'package:get/get.dart';
import 'package:p_admin/data/model/users_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

import '../../data/datasource/remote/orders/archive_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersArchiveController extends GetxController{



  List categories = [];
  String? catid;
  int? selectedCat;
  List<UsersModel> users=[];

  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val){
    if(val == "0"){
      return "137".tr; //Delivery
    }else {
      return "138".tr; //Local
    }
  }

  String printPaymentMethod(String val){
    if(val == "0"){
      return "139".tr; //Cash On Delivery
    }else {
      return "140"; //Syriatel Cash
    }
  }

  String printOrdersStatus(String val){
    if(val == "0"){
      return "141".tr; //Pending Approval
    }else if(val == "1"){
      return "142".tr; //The Order is Being Prepared
    }else if(val == "2"){
      return "Ready To Pickup By Delivery Man"; //On The Way
    }else if(val == "3"){
      return "On The Way"; //On The Way
    }else{
      return "144".tr; //Archive
    }
  }


  getOrders()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e)=>OrdersModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }


getUsers()async{
  users.clear();
  statusRequest = StatusRequest.loading;
  update();
  var response = await ordersArchiveData.getUsers();
  print("========================================Controller  $response");
  statusRequest = handlingData(response);
  if(StatusRequest.success==statusRequest){
    if(response['status']=="success"){
      List listdata = response['data'];
      users.addAll(listdata.map((e)=>UsersModel.fromJson(e)));
    }
    else{
      statusRequest = StatusRequest.none;
    }
  }
  update();
}


  refreshOrder(){
    getOrders();
  }




  @override
  void onInit() {
    getOrders();
    getUsers();
    super.onInit();
  }




}