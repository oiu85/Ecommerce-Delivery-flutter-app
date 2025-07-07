
import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/items/view_controller.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/core/services/NotificationService.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/datasource/remote/subcategories_data.dart';
import '../../data/model/subcategoriesmodel.dart';


class ItemsADDController extends GetxController{

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
        "desc" : desc.text,
        "descar" : descar.text,
        "count" : count.text,
        "price" : price.text,
        "discount" : discount.text,
        "scientificformula" : scientificformula.text,
        "scientificformulaar" : scientificformula_ar.text,
        "prescription" : prescription.text,
        "catid" : catid!.text.toString(),
        "datenow": DateTime.now().toString(),
      };
      var response = await itemsData.add(data , file!);
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
          dropdownlist.add(SelectedListItem(name: data[i].subcategoryNameAr! , value: data[i].subcategoryId!.toString() ));
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
    super.onInit();
  }


  // showDropDown(context){
  //   DropDownState(
  //     DropDown(
  //       bottomSheetTitle: Text("titel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
  //       submitButtonChild: const Text("Done" ,style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
  //       data:[
  //         SelectedListItem(name: 'a',) ,
  //         SelectedListItem(name: "b"),
  //       ],
  //       onSelected: (selectedItems) {
  //         SelectedListItem selectedListItem = selectedItems[0];
  //         dropdwonname.text = selectedListItem.name;
  //       },
  //       enableMultipleSelection: false,
  //
  //     ),
  //   ).showModal(context);
  // }



}