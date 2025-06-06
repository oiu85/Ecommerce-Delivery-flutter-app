
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();

}
class LoginControllerImp extends LoginController{
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;



  bool isShowPassword=true;
  MyServices myServices = Get.find();
  StatusRequest statusRequest =StatusRequest.none ;
  showPassword(){
    isShowPassword= isShowPassword==true?false:true;
    update();
  }


  @override
  login() async{
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("========================================Controller $response==============");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          if(response['data']['delivery_approve']==1){
            myServices.sharedPreferences.setString("id",response['data']['delivery_id'].toString());
            myServices.sharedPreferences.setString("username", response['data']['delivery_name']);
            myServices.sharedPreferences.setString("email", response['data']['delivery_email']);
            myServices.sharedPreferences.setString("phone", response['data']['delivery_phone']);
            myServices.sharedPreferences.setString("step", "2");

            String userid = myServices.sharedPreferences.getString("id")!;
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homepage);
          }
          else{
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email":email.text});
          }

        }else{
          Get.defaultDialog(title: "44".tr ,middleText: "47".tr); // "Warning  Email OR Password Not Correct"
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print("valid");


      // Get.delete<SignUpControllerImp>(); //when i use routes in map not in get x this line is work to dispose the information in the text form filed after moving to another page And instead of it we use lazy.put()
    }else {
      print("not valid");
    }
  }
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print("=============token==================");
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  goToForgetPassword(){
    Get.offNamed(AppRoute.forgetPassword);

  }
}