

import 'package:dartz/dartz.dart';

import 'package:p_admin/core/class/statusrequest.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CouponData{
  Crud crud;
  CouponData(this.crud);

  get()async{
    var response = await crud.postData(AppLink.viewcoupons, {});
    return response.fold((l) => l, (r) => r,);

  }

  add(Map data )async{
    var response = await crud.postData(AppLink.couponadd, data );
    return response.fold((l) => l, (r) => r,);

  }

  delete(Map data)async{
    var response = await crud.postData(AppLink.coupondelte, data);
    return response.fold((l) => l, (r) => r,);

  }


  edit(Map data)async{
    Either<StatusRequest, Map> response;
      response = await crud.postData(AppLink.couponedit, data);
    return response.fold((l) => l, (r) => r,);

  }

















}