
import 'package:get/get.dart';
import 'package:p_admin/data/datasource/remote/adminusers.dart';
import 'package:p_admin/data/model/users_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';



class UsersViewController extends GetxController{

  AdminUsersData adminUsersData = AdminUsersData(Get.find());

  List<UsersModel>data = [];
  late StatusRequest statusRequest;

  getData()async{
    statusRequest = StatusRequest.loading;

    var response = await adminUsersData.getData();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => UsersModel.fromJson(e)).toList());
      }

      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  unActiveUsers(String usersid , String status, int index) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await adminUsersData.unActiveData(usersid, status);
    print("=== Controller Response: $response");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {

      if (response['status'] == "success") {
        data[index].usersApprove = int.parse(status);
        update();
      } else{
        statusRequest = StatusRequest.failure;
      }

    }
  }



  @override
  void onInit() {
    getData();
    super.onInit();
  }

}