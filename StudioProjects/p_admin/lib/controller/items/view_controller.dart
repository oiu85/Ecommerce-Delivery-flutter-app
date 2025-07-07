
import 'package:get/get.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/data/datasource/remote/items_data.dart';
import 'package:p_admin/data/model/itemsmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';


class ItemsController extends GetxController{

  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;


  getData()async{

    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)).toList());

      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  deleteItems(String id, String imagename) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await itemsData.delete({
      "id": id,
      "imagename": imagename,
    });

    if (response['status'] == "success") {
      data.removeWhere((element) => element.itemsId == id);
      statusRequest = StatusRequest.success;
    }
    getData();
    update();
  }

  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsedit, arguments: {
      "itemsModel" : itemsModel,
    });
  }

  myback(){
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }

}