
import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:p_admin/controller/items/view_controller.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/core/services/NotificationService.dart';

import 'package:p_admin/data/datasource/remote/items_data.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/subcategories_data.dart';
import '../../data/model/itemsmodel.dart';
import '../../data/model/subcategoriesmodel.dart';


class ItemsEditController extends GetxController{
  var isDescExpanded = true.obs;
  var isDescArExpanded = true.obs;

  ItemsData itemsData = ItemsData(Get.find());

  NotificationService notificationService = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist= [];

  late TextEditingController dropdwonname;
  late TextEditingController dropdownid;

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController desc;
  late TextEditingController descar;

  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController scientificformula;
  late TextEditingController scientificformula_ar;

  late TextEditingController prescription;

  TextEditingController? catid;

  TextEditingController? catname;

  ItemsModel? itemsModel;

  File? file ;

  String? active;

  changeStatusActive(val){
    active = val;
    update();
  }

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


  editData()async{

    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "id": itemsModel!.itemsId.toString(),
        "imageold": itemsModel!.itemsImage.toString(),
        "name" : name.text ,
        "namear" : namear.text ,
        "desc" : desc.text,
        "descar" : descar.text,
        "count" : count.text,
        "price" : price.text,
        "active" : active!.toString(),
        "discount" : discount.text,
        "scientificformula" : scientificformula.text,
        "scientificformulaar" : scientificformula_ar.text,
        "prescription" : prescription.text,
        "catid" : catid!.text.toString(),
        "datenow": DateTime.now().toString(),
      };

      var response = await itemsData.edit(data , file);

      print("========================================Controller  $response");

      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){

          Get.offNamed(AppRoute.itemsview);
          ItemsController c =Get.find();
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
    SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await subCategoriesData.get();
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List<SubCategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => SubCategoriesModel.fromJson(e)).toList());
        for(int i=0 ; i<data.length; i++){
          dropdownlist.add(SelectedListItem(name: data[i].subcategoryName! , value: data[i].subcategoryId!.toString() ));
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    scientificformula = TextEditingController();
    scientificformula_ar = TextEditingController();
    prescription = TextEditingController();
    dropdwonname = TextEditingController();
    dropdownid = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;

    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;

    count.text = itemsModel!.itemsCount!.toString();
    price.text = itemsModel!.itemsPrice!.toString();

    discount.text = itemsModel!.itemsDiscount!.toString();

    scientificformula.text = itemsModel!.itemsScientificformula!;
    scientificformula_ar.text = itemsModel!.itemsScientificformulaAr!;

    prescription.text = itemsModel!.itemsPrescription!.toString();

    catid!.text = itemsModel!.subcategoryId!.toString();
    catname!.text = itemsModel!.subcategoryName!;

    active = itemsModel!.itemsActive.toString();

    super.onInit();
  }

}