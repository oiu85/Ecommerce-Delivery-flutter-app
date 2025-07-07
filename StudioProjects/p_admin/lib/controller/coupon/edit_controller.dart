

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/coupon/view_controller.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/core/services/NotificationService.dart';
import 'package:p_admin/data/datasource/remote/coupon_data.dart';
import 'package:p_admin/data/model/couponmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';


class CouponEditController extends GetxController{

  CouponData couponData = CouponData(Get.find());

  NotificationService notificationService = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CouponModel? couponModel ;


  List<DateTime?> dates= [];

  late TextEditingController name;

  late TextEditingController count;


  late TextEditingController discount;


  editData()async{

    if(formState.currentState!.validate()){

      if (dates.isEmpty || dates[0] == null) {
        Get.snackbar("تنبيه", "يرجى اختيار تاريخ انتهاء الكوبون");
        return;
      }
      statusRequest = StatusRequest.loading;

      update();

      DateTime? date = dates[0];
      String expDate = "${date?.year}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')} 00:00:00";
      Map data = {
        "id" : couponModel!.couponId.toString(),
        "name" : name.text,
        "exp" : expDate,
        "count" : count.text,
        "discount" : discount.text,
      };


      var response = await couponData.edit(data);

      print("========================================Controller  $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.couponview);
          CopunController c =Get.find();
          c.getData();
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
    dates.clear();
    couponModel = Get.arguments['couponModel'];
    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    name.text = couponModel!.couponName!;
    count.text = couponModel!.couponCount!.toString();
    discount.text = couponModel!.couponDiscount!.toString();
    dates.add(DateTime.parse(couponModel!.couponExpierdate!));
    super.onInit();
  }

  @override
  void onClose() {
    dates.clear();
    super.onClose();
  }
  @override
  void dispose() {
    dates.clear();
    super.dispose();
  }

}