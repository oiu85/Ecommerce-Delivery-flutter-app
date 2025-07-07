
import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/subcategories/view_controller.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/core/services/NotificationService.dart';
import 'package:p_admin/data/datasource/remote/categories_data.dart';
import 'package:p_admin/data/datasource/remote/subcategories_data.dart';
import 'package:p_admin/data/model/categoriesmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';


class SubCategoriesADDController extends GetxController{

  SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());
  NotificationService notificationService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist= [];
  late TextEditingController name;
  late TextEditingController namear;

  TextEditingController? catid;
  TextEditingController? catname;

  File? file ;

  chooseImageGalery()async{
    file = await fileUploadGallery(false);
    update();
  }

  takeImageCamera()async{
    file = await imageUploadCamera();
    update();
  }

  showOptionImage(){
    showBottomMenu(takeImageCamera, chooseImageGalery);
  }

  addData()async{
    if(formState.currentState!.validate()){
      if(file==null) {
        notificationService.showErrorNotification(title: "warning", message: "Please Choose Image First");
      }
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name" : name.text ,
        "namear" : namear.text ,
        "catid" : catid!.text.toString(),
      };
      var response = await subCategoriesData.add(data , file!);
      print("========================================Controller  $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.subcategoriesview);
          SubCategoriesController c =Get.find();
          c.update();
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

  getCategories()async{
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.get();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)).toList());
        for(int i=0 ; i<data.length; i++){
          dropdownlist.add(SelectedListItem(name: data[i].categoriesName! , value: data[i].categoriesId!.toString() ));
        }
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }


  @override
  void onInit() {
    getCategories();
    catid = TextEditingController();
    catname = TextEditingController();
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }

}