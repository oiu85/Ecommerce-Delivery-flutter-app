
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/subcategories/view_controller.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/core/services/NotificationService.dart';
import 'package:p_admin/data/datasource/remote/subcategories_data.dart';
import 'package:p_admin/data/model/subcategoriesmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';


class SubCategoriesEditController extends GetxController{

  SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());

  NotificationService notificationService = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();


  late TextEditingController name;

  late TextEditingController namear;

  SubCategoriesModel? subCategoriesModel;

  File? file ;

  chooseImage()async{
    file = await fileUploadGallery();
    update();
  }

  takeImage()async{
    file = await imageUploadCamera();
    update();
  }


  editData()async{

    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name" : name.text ,
        "namear" : namear.text ,
        "imageold" : subCategoriesModel!.subcategoryImage!,
        "id" : subCategoriesModel!.subcategoryId!.toString(),
      };

      var response = await subCategoriesData.edit(data , file);

      print("========================================Controller  $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if (response['status'] == "success") {
          SubCategoriesController c = Get.find();
          await c.getData(); // استنى البيانات ترجع
          Get.offNamed(AppRoute.subcategoriesview); // بعدين ارجع
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
    subCategoriesModel = Get.arguments['subcategoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.clear();
    namear.clear();
    name.text = subCategoriesModel!.subcategoryName!;
    namear.text = subCategoriesModel!.subcategoryNameAr!;
    print("=========================${name.text}");
    print("=============================${namear.text}");
    print("=============================${subCategoriesModel!.subcategoryId.toString()}");
    super.onInit();
  }

}