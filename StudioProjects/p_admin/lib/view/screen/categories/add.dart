
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/categories/add_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/core/shared/customtextformglobal.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';


class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesADDController controller = Get.put(CategoriesADDController());
    return Scaffold(
      appBar: AppBar(
        title: Text("223".tr),
      ),
      body: GetBuilder<CategoriesADDController>(
        builder: (controller)=> HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    Text("214".tr ,
                      style: TextStyle(
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold ,
                          color: AppColor.primaryColor),
                    ),
                    SizedBox(height: 30,),
                    CustomTextFormGlobal(
                      hintText: "215".tr,
                      labelText: "216".tr,
                      iconDate: Icons.category,
                      mycontroller: controller.name,
                      valid: (val){
                        return validInput(val!, 1, 60, "");
                      },
                      isNumber: false,
                    ),

                    CustomTextFormGlobal(
                      hintText: "217".tr,
                      labelText: "218".tr,
                      iconDate: Icons.category,
                      mycontroller: controller.namear,
                      valid: (val){
                        return validInput(val!, 1, 60, "");
                      },
                      isNumber: false,
                    ),
                    Text("219".tr ,
                      style: TextStyle(
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold ,
                          color: AppColor.primaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            onPressed: (){
                              controller.chooseImage();
                            },
                            color: AppColor.thirdColor,
                            textColor: AppColor.secondColor,
                            child:   Text("220".tr,style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            onPressed: (){
                              controller.takeImage();
                            },
                            color: AppColor.thirdColor,
                            textColor: AppColor.secondColor,
                            child:  Text("221".tr,style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                    if(controller.file !=null)
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                          child: Image.file(controller.file!,width: 200,fit: BoxFit.cover,),
                      ),
                    CustomButtomAuth(
                      text: "224".tr ,
                      onPressed: (){
                        controller.addData();
                      },
                    )
                  ],
                ),
              ),
            ),
        )
      )
    );
  }
}
