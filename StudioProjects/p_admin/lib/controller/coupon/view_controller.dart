
import 'package:get/get.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/data/model/couponmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/coupon_data.dart';


class CopunController extends GetxController{

  CouponData couponData = CouponData(Get.find());

  List<CouponModel> data = [];
  late StatusRequest statusRequest;


  getData()async{

    data.clear();

    statusRequest = StatusRequest.loading;

    update();
    var response = await couponData.get();

    print("========================================Controller  $response");

    statusRequest = handlingData(response);

    if(StatusRequest.success==statusRequest){

      if(response['status']=="success"){

        List datalist = response['data'];
        data.addAll(datalist.map((e) => CouponModel.fromJson(e)).toList());

      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  deleteCoupon(String id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await couponData.delete({"id": id,});

    if (response['status'] == "success") {
      data.removeWhere((element) => element.couponId == id);
      statusRequest = StatusRequest.success;
    }
    getData();
    update();
  }

  goToPageEdit(CouponModel couponModel){
    Get.toNamed(AppRoute.couponedit, arguments: {
      "couponModel" : couponModel,
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