
import 'package:get/get.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/data/datasource/remote/categories_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/model/categoriesmodel.dart';


class CategoriesController extends GetxController{

  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;


  getData()async{

    data.clear();

    statusRequest = StatusRequest.loading;

    update();
    var response = await categoriesData.get();

    print("========================================Controller  $response");

    statusRequest = handlingData(response);

    if(StatusRequest.success==statusRequest){

      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)).toList());

      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  deleteCategory(String id, String imagename) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesData.delete({
      "id": id,
      "imagename": imagename,
    });

    if (response['status'] == "success") {
      data.removeWhere((element) => element.categoriesId == id);
      statusRequest = StatusRequest.success;
    }
    getData();
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesedit, arguments: {
      "categoriesModel" : categoriesModel,
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