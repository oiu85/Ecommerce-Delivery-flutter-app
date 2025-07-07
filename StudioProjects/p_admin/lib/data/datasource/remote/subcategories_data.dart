
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:p_admin/core/class/statusrequest.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SubCategoriesData {
  Crud crud;

  SubCategoriesData(this.crud);

  get() async {
    var response = await crud.postData(AppLink.subcategoriesview, {});
    return response.fold((l) => l, (r) => r,);
  }

  add(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(AppLink.subcategoriesadd, data, file);
    return response.fold((l) => l, (r) => r,);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.subcategoriesdelete, data);
    return response.fold((l) => l, (r) => r,);
  }


  edit(Map data, [File? file])async{
    Either<StatusRequest, Map> response;
    if(file == null) {
      response = await crud.postData(AppLink.subcategoriesedit, data);
    }else{
      response = await crud.addRequestWithImageOne(AppLink.subcategoriesedit, data ,file);
    }
    return response.fold((l) => l, (r) => r,);

  }














}