
import 'package:get/get.dart';
import 'package:p_admin/data/datasource/remote/subcategories_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/model/subcategoriesmodel.dart';


class SubCategoriesController extends GetxController{

  SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());

  List<SubCategoriesModel> data = [];
  late StatusRequest statusRequest;


  getData()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await subCategoriesData.get();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){

      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => SubCategoriesModel.fromJson(e)).toList());
        update();

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

    var response = await subCategoriesData.delete({
      "id": id,
      "imagename": imagename,
    });

    if (response['status'] == "success") {
      data.removeWhere((element) => element.subcategoryId == id);
      statusRequest = StatusRequest.success;
    }
    getData();
    update();
  }


  goToPageEdit(SubCategoriesModel subcategoriesModel){
    Get.toNamed(AppRoute.subcategoriesedit, arguments: {
      "subcategoriesModel" : subcategoriesModel,
    });
  }



  @override
  void onInit() {
    getData();
    super.onInit();
  }

}

